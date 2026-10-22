import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/presentation/helpers/open_patient_profile.dart';
import 'package:doctor_clinics_app/features/patients/presentation/helpers/patient_form_outcome.dart';

/// Opens the record of an already-registered patient from the new-patient form.
///
/// An [exact] name match also closes the form with that patient, so the
/// secretary never writes a second file for the same person; partial matches
/// only show the record so the two names can be compared.
Future<void> openRegisteredPatient(
  BuildContext context,
  Patient patient, {
  required bool exact,
}) async {
  await openPatientProfile(context, patient);
  if (!exact || !context.mounted) return;
  Navigator.pop(context, PatientFormOutcome(patient: patient, created: false));
}
