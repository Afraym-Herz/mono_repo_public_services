import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/patients/data/datasources/patient_datasource.dart';
import 'package:doctor_clinics_app/features/patients/data/repositories/patient_repository_guard.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_allergy.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_condition.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

class PatientRepositoryImpl implements PatientRepository {
  final IPatientDatasource datasource;

  PatientRepositoryImpl({required this.datasource});

  @override
  FutureResult<void> addPatient(Patient patient) =>
      guardPatientVoid('addPatient', () => datasource.insert(patient));

  @override
  FutureResult<void> deletePatient(int id) =>
      guardPatientVoid('deletePatient', () => datasource.softDelete(id));

  @override
  FutureResult<List<Patient>> getAllPatients() =>
      guardPatient('getAllPatients', datasource.fetchAll);

  @override
  FutureResult<Patient?> getPatientById(int id) =>
      guardPatient('getPatientById', () => datasource.fetchById(id));

  @override
  FutureResult<void> updatePatient(Patient patient) =>
      guardPatientVoid('updatePatient', () => datasource.update(patient));

  @override
  FutureResult<List<Patient>> searchPatients(String query) =>
      guardPatient('searchPatients', () => datasource.search(query));

  @override
  FutureResult<List<PatientAllergy>> getPatientAllergies(int patientId) =>
      guardPatient(
        'getPatientAllergies',
        () => datasource.fetchAllergies(patientId),
      );

  @override
  FutureResult<void> addAllergy(PatientAllergy allergy) =>
      guardPatientVoid('addAllergy', () => datasource.insertAllergy(allergy));

  @override
  FutureResult<void> removeAllergy(int allergyId) => guardPatientVoid(
        'removeAllergy',
        () => datasource.deleteAllergy(allergyId),
      );

  @override
  FutureResult<List<PatientCondition>> getPatientConditions(int patientId) =>
      guardPatient(
        'getPatientConditions',
        () => datasource.fetchConditions(patientId),
      );

  @override
  FutureResult<void> addCondition(PatientCondition condition) =>
      guardPatientVoid('addCondition', () => datasource.insertCondition(condition));

  @override
  FutureResult<void> removeCondition(int conditionId) => guardPatientVoid(
        'removeCondition',
        () => datasource.deleteCondition(conditionId),
      );
}
