import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

abstract class PatientRepository {
  Future<List<Patient>> getAllPatients();
  Future<Patient?> getPatientById(int id);
  Future<void> addPatient(Patient patient);
  Future<void> updatePatient(Patient patient);
  Future<void> deletePatient(int id);
}
