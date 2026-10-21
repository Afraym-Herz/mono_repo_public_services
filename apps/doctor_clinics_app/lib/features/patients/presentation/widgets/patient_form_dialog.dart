import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_form_cubit.dart';
import 'package:doctor_clinics_app/features/patients/presentation/helpers/patient_form_controller.dart';
import 'package:doctor_clinics_app/features/patients/presentation/widgets/patient_form_view.dart';

/// Opens the new-patient modal and returns the stored patient.
Future<Patient?> showPatientFormDialog(BuildContext context) {
  return showGeneralDialog<Patient>(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: AppColors.scrim,
    pageBuilder: (_, _, _) => BlocProvider(
      create: (_) => getIt<PatientFormCubit>(),
      child: const PatientFormDialog(),
    ),
  );
}

class PatientFormDialog extends StatefulWidget {
  const PatientFormDialog({super.key});

  @override
  State<PatientFormDialog> createState() => _PatientFormDialogState();
}

class _PatientFormDialogState extends State<PatientFormDialog> {
  late final PatientFormController _controller = PatientFormController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PatientFormCubit, PatientFormState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.maybeMap(
          saved: (saved) => Navigator.pop(context, saved.patient),
          error: (error) => AppSnackBar.showError(context, error.message),
          orElse: () {},
        );
      },
      child: PatientFormView(
        controller: _controller,
        onClose: () => Navigator.pop(context),
        onSave: _save,
      ),
    );
  }

  void _save() {
    if (!_controller.formKey.currentState!.validate()) return;
    context.read<PatientFormCubit>().save(_controller.toPatient());
  }
}
