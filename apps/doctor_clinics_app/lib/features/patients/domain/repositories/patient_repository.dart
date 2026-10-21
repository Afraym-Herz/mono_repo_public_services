import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_allergy.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_condition.dart';

abstract class PatientRepository {
  FutureResult<List<Patient>> getAllPatients();
  FutureResult<Patient?> getPatientById(int id);
  FutureResult<int?> getMaxFileNumber();
  FutureResult<Patient> addPatient(Patient patient);
  FutureResult<void> updatePatient(Patient patient);
  FutureResult<void> deletePatient(int id);
  FutureResult<List<Patient>> searchPatients(String query);

  FutureResult<List<PatientAllergy>> getPatientAllergies(int patientId);
  FutureResult<void> addAllergy(PatientAllergy allergy);
  FutureResult<void> removeAllergy(int allergyId);

  FutureResult<List<PatientCondition>> getPatientConditions(int patientId);
  FutureResult<void> addCondition(PatientCondition condition);
  FutureResult<void> removeCondition(int conditionId);
}
