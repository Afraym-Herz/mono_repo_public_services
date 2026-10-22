import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_form_cubit.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_name_matches_cubit.dart';
import 'package:doctor_clinics_app/features/patients/presentation/helpers/patient_form_controller.dart';
import 'package:doctor_clinics_app/features/patients/presentation/helpers/patient_form_duplicate_guard.dart';
import 'package:doctor_clinics_app/features/patients/presentation/helpers/patient_form_outcome.dart';
import 'package:doctor_clinics_app/features/patients/presentation/widgets/patient_form_view.dart';

/// Opens the new-patient modal and returns what was saved or picked.
Future<PatientFormOutcome?> showPatientFormDialog(BuildContext context) {
  return showGeneralDialog<PatientFormOutcome>(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: AppColors.scrim,
    pageBuilder: (_, _, _) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<PatientFormCubit>()),
        BlocProvider(create: (_) => getIt<PatientNameMatchesCubit>()),
      ],
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
          saved: (saved) => Navigator.pop(
            context,
            PatientFormOutcome(patient: saved.patient, created: true),
          ),
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

  Future<void> _save() async {
    if (!_controller.formKey.currentState!.validate()) return;
    final draft = _controller.toPatient();
    final outcome = await resolveDuplicatePatient(context, draft: draft);
    if (outcome == null || !mounted) return;
    if (!outcome.created) {
      Navigator.pop(context, outcome);
      return;
    }
    context.read<PatientFormCubit>().save(draft);
  }
}
