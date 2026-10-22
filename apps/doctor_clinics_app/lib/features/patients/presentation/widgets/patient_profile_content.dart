import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

import '../helpers/patient_profile_edit_controller.dart';
import 'patient_profile_edit_fields.dart';
import 'patient_profile_read_fields.dart';

/// Switches the profile between read-only values and pencil-mode editors.
class PatientProfileContent extends StatelessWidget {
  const PatientProfileContent({
    super.key,
    required this.patient,
    required this.controller,
    required this.isEditing,
  });

  final Patient patient;
  final PatientProfileEditController controller;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    if (!isEditing) return PatientProfileReadFields(patient: patient);
    return PatientProfileEditFields(controller: controller);
  }
}
