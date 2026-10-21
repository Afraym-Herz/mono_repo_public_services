import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart'
    as entity;
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_allergy.dart'
    as entity;
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_condition.dart'
    as entity;

/// Row↔entity/companion mapping for the Drift patient tables. Kept out of
/// [PatientDriftDatasource] so the datasource stays a thin DAO wrapper.
entity.Patient toDomainPatient(Patient row) {
  return entity.Patient(
    id: row.id,
    fileNumber: row.fileNumber,
    fullName: row.fullName,
    searchText: row.searchText,
    gender: row.gender,
    birthDate: row.birthDate,
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

PatientsCompanion toPatientCompanion(entity.Patient patient) {
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

entity.PatientAllergy toDomainAllergy(PatientAllergy row) {
  return entity.PatientAllergy(
    id: row.id,
    patientId: row.patientId,
    name: row.name,
    severity: row.severity,
    notes: row.notes,
  );
}

PatientAllergiesCompanion toAllergyCompanion(entity.PatientAllergy allergy) {
  return PatientAllergiesCompanion(
    patientId: Value(allergy.patientId),
    name: Value(allergy.name),
    severity: Value(allergy.severity),
    notes: Value(allergy.notes),
  );
}

entity.PatientCondition toDomainCondition(PatientCondition row) {
  return entity.PatientCondition(
    id: row.id,
    patientId: row.patientId,
    name: row.name,
    sinceDate: row.sinceDate,
    notes: row.notes,
  );
}

PatientConditionsCompanion toConditionCompanion(
  entity.PatientCondition condition,
) {
  return PatientConditionsCompanion(
    patientId: Value(condition.patientId),
    name: Value(condition.name),
    sinceDate: Value(condition.sinceDate),
    notes: Value(condition.notes),
  );
}
