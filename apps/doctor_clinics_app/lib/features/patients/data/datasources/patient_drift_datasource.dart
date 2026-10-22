import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
import 'package:doctor_clinics_app/features/patients/data/datasources/patient_mappers.dart';
import 'package:doctor_clinics_app/features/patients/data/datasources/patient_datasource.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart'
    as entity;
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_allergy.dart'
    as entity;
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_condition.dart'
    as entity;

/// Concrete Drift implementation of [IPatientDatasource].
class PatientDriftDatasource implements IPatientDatasource {
  final PatientDao patientDao;

  PatientDriftDatasource(this.patientDao);

  @override
  Future<List<entity.Patient>> fetchAll() async {
    final rows = await patientDao.getAllPatients();
    return rows.map(toDomainPatient).toList();
  }

  @override
  Future<entity.Patient?> fetchById(int id) async {
    final row = await patientDao.getPatientById(id);
    return row == null ? null : toDomainPatient(row);
  }

  @override
  Future<int?> getMaxFileNumber() => patientDao.getMaxNumericFileNumber();

  @override
  Future<int> insert(entity.Patient patient) async {
    return patientDao.insertPatient(toPatientCompanion(patient));
  }

  @override
  Future<void> update(entity.Patient patient) async {
    final updated = await patientDao.updatePatient(toPatientCompanion(patient));
    if (!updated) {
      throw StateError('patients.updatePatient: row ${patient.id} not found');
    }
  }

  @override
  Future<void> softDelete(int id) async {
    await patientDao.softDeletePatient(id);
  }

  @override
  Future<List<entity.Patient>> search(String normalizedQuery) async {
    final rows = await patientDao.searchPatients(normalizedQuery);
    return rows.map(toDomainPatient).toList();
  }

  @override
  Future<List<entity.PatientAllergy>> fetchAllergies(int patientId) async {
    final rows = await patientDao.getPatientAllergies(patientId);
    return rows.map(toDomainAllergy).toList();
  }

  @override
  Future<void> insertAllergy(entity.PatientAllergy allergy) async {
    await patientDao.insertAllergy(toAllergyCompanion(allergy));
  }

  @override
  Future<void> deleteAllergy(int id) async {
    await patientDao.deleteAllergy(id);
  }

  @override
  Future<List<entity.PatientCondition>> fetchConditions(int patientId) async {
    final rows = await patientDao.getPatientConditions(patientId);
    return rows.map(toDomainCondition).toList();
  }

  @override
  Future<void> insertCondition(entity.PatientCondition condition) async {
    await patientDao.insertCondition(toConditionCompanion(condition));
  }

  @override
  Future<void> deleteCondition(int id) async {
    await patientDao.deleteCondition(id);
  }
}
