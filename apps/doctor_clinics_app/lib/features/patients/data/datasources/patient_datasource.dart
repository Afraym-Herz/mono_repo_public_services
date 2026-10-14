import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_allergy.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_condition.dart';

/// Local data-source contract for patients (backed by Drift).
abstract class IPatientDatasource {
  //   Patients
  Future<List<Patient>> fetchAll();
  Future<Patient?> fetchById(int id);
  Future<int> insert(Patient patient);
  Future<void> update(Patient patient);
  Future<void> softDelete(int id);
  Future<List<Patient>> search(String normalizedQuery);

  //   Allergies
  Future<List<PatientAllergy>> fetchAllergies(int patientId);
  Future<void> insertAllergy(PatientAllergy allergy);
  Future<void> deleteAllergy(int id);

  //   Conditions
  Future<List<PatientCondition>> fetchConditions(int patientId);
  Future<void> insertCondition(PatientCondition condition);
  Future<void> deleteCondition(int id);
}
