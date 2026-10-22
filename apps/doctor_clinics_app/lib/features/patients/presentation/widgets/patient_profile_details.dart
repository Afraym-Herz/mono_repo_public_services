import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/presentation/helpers/patient_profile_edit_controller.dart';

import 'patient_profile_editor.dart';

/// Owns the draft controller for the lifetime of the loaded profile.
class PatientProfileDetails extends StatefulWidget {
  const PatientProfileDetails({super.key, required this.patient});

  final Patient patient;

  @override
  State<PatientProfileDetails> createState() => _PatientProfileDetailsState();
}

class _PatientProfileDetailsState extends State<PatientProfileDetails> {
  late final PatientProfileEditController _controller =
      PatientProfileEditController(widget.patient);

  @override
  void didUpdateWidget(covariant PatientProfileDetails oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.patient.id != widget.patient.id ||
        oldWidget.patient.updatedAt != widget.patient.updatedAt) {
      _controller.syncOriginal(widget.patient);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PatientProfileEditor(
      patient: widget.patient,
      controller: _controller,
    );
  }
}
