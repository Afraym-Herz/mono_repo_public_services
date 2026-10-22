import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

/// Result of the new-patient modal.
///
/// [created] is false when the secretary picked a patient that was already
/// registered instead of writing a duplicate file, so callers only celebrate
/// (snackbar, reload) when a new file really landed.
class PatientFormOutcome {
  const PatientFormOutcome({required this.patient, required this.created});

  final Patient patient;
  final bool created;
}
