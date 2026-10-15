import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
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
    return rows.map(_toDomainPatient).toList();
  }

  @override
  Future<entity.Patient?> fetchById(int id) async {
    final row = await patientDao.getPatientById(id);
    return row == null ? null : _toDomainPatient(row);
  }

  @override
  Future<int> insert(entity.Patient patient) async {
    return patientDao.insertPatient(_toPatientCompanion(patient));
  }

  @override
  Future<void> update(entity.Patient patient) async {
    await patientDao.updatePatient(_toPatientCompanion(patient));
  }

  @override
  Future<void> softDelete(int id) async {
    await patientDao.softDeletePatient(id);
  }

  @override
  Future<List<entity.Patient>> search(String normalizedQuery) async {
    final rows = await patientDao.searchPatients(normalizedQuery);
    return rows.map(_toDomainPatient).toList();
  }

  @override
  Future<List<entity.PatientAllergy>> fetchAllergies(int patientId) async {
    final rows = await patientDao.getPatientAllergies(patientId);
    return rows.map(_toDomainAllergy).toList();
  }

  @override
  Future<void> insertAllergy(entity.PatientAllergy allergy) async {
    await patientDao.insertAllergy(
      PatientAllergiesCompanion(
        patientId: Value(allergy.patientId),
        name: Value(allergy.name),
        severity: Value(allergy.severity),
        notes: Value(allergy.notes),
      ),
    );
  }

  @override
  Future<void> deleteAllergy(int id) async {
    await patientDao.deleteAllergy(id);
  }

  @override
  Future<List<entity.PatientCondition>> fetchConditions(int patientId) async {
    final rows = await patientDao.getPatientConditions(patientId);
    return rows.map(_toDomainCondition).toList();
  }

  @override
  Future<void> insertCondition(entity.PatientCondition condition) async {
    await patientDao.insertCondition(
      PatientConditionsCompanion(
        patientId: Value(condition.patientId),
        name: Value(condition.name),
        sinceDate: Value(condition.sinceDate),
        notes: Value(condition.notes),
      ),
    );
  }

  @override
  Future<void> deleteCondition(int id) async {
    await patientDao.deleteCondition(id);
  }

  entity.Patient _toDomainPatient(Patient row) {
    return entity.Patient(
      id: row.id,
      fileNumber: row.fileNumber,
      fullName: row.fullName,
      searchText: row.searchText,
      gender: row.gender,
      birthDate: row.birthDate ?? DateTime(1970),
      phone: row.phone,
      phone2: row.phone2,
      address: row.address,
      occupation: row.occupation,
      notes: row.notes,
      bloodType: row.bloodType,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      deletedAt: row.deletedAt,
    );
  }

  PatientsCompanion _toPatientCompanion(entity.Patient patient) {
    return PatientsCompanion(
      id: patient.id > 0 ? Value(patient.id) : const Value.absent(),
      fileNumber: Value(patient.fileNumber),
      fullName: Value(patient.fullName),
      searchText: Value(patient.searchText),
      gender: Value(patient.gender),
      birthDate: Value(patient.birthDate),
      phone: Value(patient.phone),
      phone2: Value(patient.phone2),
      address: Value(patient.address),
      occupation: Value(patient.occupation),
      notes: Value(patient.notes),
      bloodType: Value(patient.bloodType),
      createdAt: Value(patient.createdAt),
      updatedAt: Value(DateTime.now()),
      deletedAt: Value(patient.deletedAt),
    );
  }

  entity.PatientAllergy _toDomainAllergy(PatientAllergy row) {
    return entity.PatientAllergy(
      id: row.id,
      patientId: row.patientId,
      name: row.name,
      severity: row.severity,
      notes: row.notes,
    );
  }

  entity.PatientCondition _toDomainCondition(PatientCondition row) {
    return entity.PatientCondition(
      id: row.id,
      patientId: row.patientId,
      name: row.name,
      sinceDate: row.sinceDate,
      notes: row.notes,
    );
  }
}
