import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_form_cubit.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_controller.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_submit.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_values.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_form_centered.dart';

/// Barrier-backed host for the operation form.
///
/// Serves `/operations/new` with no [entry], and the edit modal with the record
/// to seed — same host, two modes.
class OperationFormScreen extends StatefulWidget {
  const OperationFormScreen({super.key, this.entry});

  /// The record being edited; `null` means a brand-new operation.
  final OperationEntry? entry;

  @override
  State<OperationFormScreen> createState() => _OperationFormScreenState();
}

class _OperationFormScreenState extends State<OperationFormScreen> {
  late final OperationFormController _controller = OperationFormController();

  @override
  void initState() {
    super.initState();
    final entry = widget.entry;
    if (entry != null) _controller.populate(entry);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OperationFormCubit>(),
      child: BlocConsumer<OperationFormCubit, OperationFormState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          state.maybeMap(
            saved: (saved) => context.pop<Operation>(saved.operation),
            error: (error) => AppSnackBar.showError(context, error.message),
            orElse: () {},
          );
        },
        builder: (context, state) {
          final form = OperationFormCentered(
            controller: _controller,
            isEditing: widget.entry != null,
            onClose: () => context.pop(),
            onSave: () => OperationFormSubmit.run(
              context,
              controller: _controller,
              entry: widget.entry,
            ),
          );
          return Scaffold(
            backgroundColor: AppColors.transparent,
            body: AdaptiveLayout(
              mobileLayout: (_) => form,
              tabletLayout: (_) => form,
              desktopLayout: (_) => form,
            ),
          );
        },
      ),
    );
  }
}
