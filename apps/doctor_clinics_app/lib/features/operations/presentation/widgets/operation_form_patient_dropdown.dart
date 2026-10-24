import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_controller.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

/// Dropdown itself, kept separate from the loading/empty chrome.
class OperationFormPatientDropdown extends StatelessWidget {
  const OperationFormPatientDropdown({
    super.key,
    required this.controller,
    required this.patients,
    required this.selectedId,
    required this.loaded,
  });

  final OperationFormController controller;
  final List<Patient> patients;
  final int? selectedId;
  final bool loaded;

  @override
  Widget build(BuildContext context) {
    return AppDropdownField<int>(
      label: 'operation_form.patient'.tr(),
      hint: loaded
          ? patients.isEmpty
                ? 'operation_form.no_patients'.tr()
                : 'operation_form.patient_hint'.tr()
          : 'operation_form.loading_patients'.tr(),
      value: patients.any((patient) => patient.id == selectedId)
          ? selectedId
          : null,
      prefixIcon: Icons.person_outline_rounded,
      enabled: loaded && patients.isNotEmpty,
      validator: (_) =>
          selectedId == null ? 'operation_form.patient_required'.tr() : null,
      items: [
        for (final patient in patients)
          DropdownMenuItem<int>(
            value: patient.id,
            child: Text(
              '${patient.fileNumber} — ${patient.fullName}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
      onChanged: (value) => controller.patientId.value = value,
    );
  }
}
