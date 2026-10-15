import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
import 'package:doctor_clinics_app/features/patients/data/datasources/patient_datasource.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart' as entity;
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_allergy.dart' as entity;
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_condition.dart' as entity;

/// Concrete Drift implementation of [IPatientDatasource].
class PatientDriftDatasource implements IPatientDatasource {
  final PatientDao patientDao;

  PatientDriftDatasource(this.patientDao);

  @override
  Future<List<entity.Patient>> fetchAll() async {
    // TODO: Map Drift table data to domain entity
    throw UnimplementedError();
  }

  @override
  Future<entity.Patient?> fetchById(int id) async {
    // TODO: Map Drift table data to domain entity
    throw UnimplementedError();
  }

  @override
  Future<int> insert(entity.Patient patient) async {
    // TODO: Insert via _patientDao
    throw UnimplementedError();
  }

  @override
  Future<void> update(entity.Patient patient) async {
    // TODO: Update via _patientDao
    throw UnimplementedError();
  }

  @override
  Future<void> softDelete(int id) async {
    // TODO: Soft delete via _patientDao
    throw UnimplementedError();
  }

  @override
  Future<List<entity.Patient>> search(String normalizedQuery) async {
    // TODO: Search via _patientDao
    throw UnimplementedError();
  }

  @override
  Future<List<entity.PatientAllergy>> fetchAllergies(int patientId) async {
    // TODO: Fetch allergies via _patientDao
    throw UnimplementedError();
  }

  @override
  Future<void> insertAllergy(entity.PatientAllergy allergy) async {
    // TODO: Insert allergy via _patientDao
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAllergy(int id) async {
    // TODO: Delete allergy via _patientDao
    throw UnimplementedError();
  }

  @override
  Future<List<entity.PatientCondition>> fetchConditions(int patientId) async {
    // TODO: Fetch conditions via _patientDao
    throw UnimplementedError();
  }

  @override
  Future<void> insertCondition(entity.PatientCondition condition) async {
    // TODO: Insert condition via _patientDao
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCondition(int id) async {
    // TODO: Delete condition via _patientDao
    throw UnimplementedError();
  }
}
