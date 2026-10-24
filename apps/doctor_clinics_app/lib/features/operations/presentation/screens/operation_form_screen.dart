import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_form_cubit.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_controller.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_form_centered.dart';

/// Barrier-backed host for the new-operation form.
class OperationFormScreen extends StatefulWidget {
  const OperationFormScreen({super.key});

  @override
  State<OperationFormScreen> createState() => _OperationFormScreenState();
}

class _OperationFormScreenState extends State<OperationFormScreen> {
  late final OperationFormController _controller = OperationFormController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final form = OperationFormCentered(
      controller: _controller,
      onClose: () => context.pop(),
      onSave: _save,
    );
    return BlocProvider(
      create: (_) => getIt<OperationFormCubit>(),
      child: BlocListener<OperationFormCubit, OperationFormState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          state.maybeMap(
            saved: (saved) => context.pop<Operation>(saved.operation),
            error: (error) => AppSnackBar.showError(context, error.message),
            orElse: () {},
          );
        },
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          body: AdaptiveLayout(
            mobileLayout: (_) => form,
            tabletLayout: (_) => form,
            desktopLayout: (_) => form,
          ),
        ),
      ),
    );
  }

  void _save() {
    if (_controller.patientId.value == null) {
      AppSnackBar.showError(context, 'operation_form.patient_required'.tr());
      return;
    }
    if (!(_controller.formKey.currentState?.validate() ?? false)) return;
    context.read<OperationFormCubit>().save(
      operation: _controller.toOperation(),
      testNames: _controller.tests.value,
    );
  }
}
