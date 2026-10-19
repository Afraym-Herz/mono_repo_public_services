import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/medicine.dart'
    as entity;
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription.dart'
    as entity;

/// Row↔entity/companion mapping for the Drift medicine and prescription
/// tables. Kept out of [PrescriptionDriftDatasource] so the datasource stays a
/// thin DAO wrapper.
entity.Medicine toDomainMedicine(Medicine row) {
  final now = DateTime.now();
  return entity.Medicine(
    id: row.id,
    name: row.name,
    alias: row.alias,
    searchText: row.searchText,
    defaultInstructions: row.instructions,
    createdAt: now,
    updatedAt: now,
  );
}

MedicinesCompanion toMedicineCompanion(entity.Medicine m) {
  return MedicinesCompanion(
    id: m.id > 0 ? Value(m.id) : const Value.absent(),
    name: Value(m.name),
    alias: Value(m.alias),
    searchText: Value(m.searchText ?? m.name.toLowerCase()),
    instructions: Value(m.defaultInstructions),
  );
}

entity.Prescription toDomainPrescription(Prescription row) {
  return entity.Prescription(
    id: row.id,
    patientId: row.patientId,
    consultationId: row.consultationId ?? 0,
    prescriptionDate: row.date,
    notes: row.notes,
    createdBy: int.tryParse(row.createdBy) ?? 0,
    createdAt: row.date,
    updatedAt: row.date,
  );
}

PrescriptionsCompanion toPrescriptionCompanion(entity.Prescription p) {
  return PrescriptionsCompanion(
    id: p.id > 0 ? Value(p.id) : const Value.absent(),
    patientId: Value(p.patientId),
    consultationId:
        p.consultationId > 0 ? Value(p.consultationId) : const Value.absent(),
    date: Value(p.prescriptionDate),
    notes: Value(p.notes),
    createdBy: Value(p.createdBy.toString()),
  );
}
