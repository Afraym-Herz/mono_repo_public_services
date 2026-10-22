import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

/// Opens the patient profile modal over the current screen.
///
/// Returns `true` when the profile was edited and saved, so the register behind
/// the modal can reload.
Future<bool> openPatientProfile(BuildContext context, Patient patient) =>
    openPatientProfileById(context, patient.id);

/// Opens the patient profile modal for [patientId].
Future<bool> openPatientProfileById(BuildContext context, int patientId) async {
  final changed = await context.push<bool>('${Routes.patients}/$patientId');
  return changed ?? false;
}
