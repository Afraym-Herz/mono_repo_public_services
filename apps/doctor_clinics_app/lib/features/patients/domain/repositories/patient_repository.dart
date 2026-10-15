import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

abstract class PatientRepository {
  FutureResult<List<Patient>> getAllPatients();
  FutureResult<Patient?> getPatientById(int id);
  FutureResult<void> addPatient(Patient patient);
  FutureResult<void> updatePatient(Patient patient);
  FutureResult<void> deletePatient(int id);
}
