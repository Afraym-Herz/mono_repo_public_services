import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

/// Opens the read-only patient profile modal over the current screen.
Future<void> openPatientProfile(BuildContext context, Patient patient) =>
    openPatientProfileById(context, patient.id);

/// Opens the read-only patient profile modal for [patientId].
Future<void> openPatientProfileById(BuildContext context, int patientId) async {
  await context.push('${Routes.patients}/$patientId');
}
