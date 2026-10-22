import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_cubit.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_edit_cubit.dart';
import 'package:doctor_clinics_app/features/patients/presentation/helpers/patient_profile_edit_controller.dart';

import 'patient_profile_body.dart';

/// Wires the edit cubit, the draft controller and the card body together.
class PatientProfileEditor extends StatelessWidget {
  const PatientProfileEditor({
    super.key,
    required this.patient,
    required this.controller,
  });

  final Patient patient;
  final PatientProfileEditController controller;

  void _save(BuildContext context) {
    if (!controller.validate()) return;
    context.read<PatientEditCubit>().save(controller.toPatient());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientEditCubit, PatientEditState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.maybeMap<void>(
          saved: (saved) {
            context.read<PatientCubit>().applyPatient(saved.patient);
            controller.finishSave(saved.patient);
            AppSnackBar.showSuccess(context, 'patient_profile.saved'.tr());
            context.read<PatientEditCubit>().reset();
          },
          error: (error) {
            AppSnackBar.showError(context, 'patient_profile.save_error'.tr());
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isSaving = state.maybeMap(
          saving: (_) => true,
          orElse: () => false,
        );
        return ValueListenableBuilder<bool>(
          valueListenable: controller.isEditing,
          builder: (context, isEditing, _) => PatientProfileBody(
            patient: patient,
            controller: controller,
            isEditing: isEditing,
            isSaving: isSaving,
            onEdit: controller.startEditing,
            onCancel: controller.cancel,
            onSave: () => _save(context),
            onClose: () => context.pop(controller.didSave),
          ),
        );
      },
    );
  }
}
