import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/prescription_dao.dart';
import 'package:doctor_clinics_app/features/prescriptions/data/datasources/prescription_datasource.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/medicine.dart'
    as entity;
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription.dart'
    as entity;
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_item.dart'
    as entity;
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_template.dart'
    as entity;

/// Concrete Drift implementation of [IPrescriptionDatasource].
class PrescriptionDriftDatasource implements IPrescriptionDatasource {
  final PrescriptionDao dao;

  PrescriptionDriftDatasource(this.dao);

  @override
  Future<List<entity.Medicine>> fetchAllMedicines() async {
    final rows = await dao.getAllMedicines();
    return rows.map(_toDomainMedicine).toList();
  }

  @override
  Future<List<entity.Medicine>> searchMedicines(String query) async {
    final rows = await dao.searchMedicines(query);
    return rows.map(_toDomainMedicine).toList();
  }

  @override
  Future<int> insertMedicine(entity.Medicine medicine) async {
    return dao.insertMedicine(_toMedicineCompanion(medicine));
  }

  @override
  Future<void> updateMedicine(entity.Medicine medicine) async {
    await dao.updateMedicine(_toMedicineCompanion(medicine));
  }

  @override
  Future<void> softDeleteMedicine(int id) async {
    await dao.deleteMedicine(id);
  }

  @override
  Future<List<entity.Prescription>> fetchByPatient(int patientId) async {
    final rows = await dao.getPrescriptionsForPatient(patientId);
    return rows.map(_toDomainPrescription).toList();
  }

  @override
  Future<int> insertPrescription(entity.Prescription prescription) async {
    return dao.insertPrescription(_toPrescriptionCompanion(prescription));
  }

  @override
  Future<void> insertItem(entity.PrescriptionItem item) async {
    await dao.insertPrescriptionItem(_toItemCompanion(item));
  }

  @override
  Future<void> deleteItem(int itemId) async {
    await dao.deletePrescriptionItem(itemId);
  }

  @override
  Future<List<entity.PrescriptionItem>> fetchItems(int prescriptionId) async {
    final rows = await dao.getPrescriptionItems(prescriptionId);
    return rows.map(_toDomainItem).toList();
  }

  @override
  Future<List<entity.PrescriptionTemplate>> fetchTemplates() async {
    final rows = await dao.getAllTemplates();
    return rows.map(_toDomainTemplate).toList();
  }

  @override
  Future<int> insertTemplate(entity.PrescriptionTemplate template) async {
    return dao.insertTemplate(
      PrescriptionTemplatesCompanion(
        id: template.id > 0 ? Value(template.id) : const Value.absent(),
        name: Value(template.name),
        notes: Value(template.description),
        itemsJson: const Value('[]'),
      ),
    );
  }

  @override
  Future<void> deleteTemplate(int id) async {
    await dao.deleteTemplate(id);
  }

  entity.Medicine _toDomainMedicine(Medicine row) {
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

  MedicinesCompanion _toMedicineCompanion(entity.Medicine m) {
    return MedicinesCompanion(
      id: m.id > 0 ? Value(m.id) : const Value.absent(),
      name: Value(m.name),
      alias: Value(m.alias),
      searchText: Value(m.searchText ?? m.name.toLowerCase()),
      instructions: Value(m.defaultInstructions),
    );
  }

  entity.Prescription _toDomainPrescription(Prescription row) {
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

  PrescriptionsCompanion _toPrescriptionCompanion(entity.Prescription p) {
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

  entity.PrescriptionItem _toDomainItem(PrescriptionItem row) {
    return entity.PrescriptionItem(
      id: row.id,
      prescriptionId: row.prescriptionId,
      medicineId: row.medicineId,
      medicineName: row.medicineName,
      dosage: row.dosage,
      frequency: row.frequency,
      duration: row.duration,
      instructions: row.instructions,
      notes: row.notes,
    );
  }

  PrescriptionItemsCompanion _toItemCompanion(entity.PrescriptionItem item) {
    return PrescriptionItemsCompanion(
      id: item.id > 0 ? Value(item.id) : const Value.absent(),
      prescriptionId: Value(item.prescriptionId),
      medicineId: Value(item.medicineId),
      medicineName: Value(item.medicineName),
      dosage: Value(item.dosage),
      frequency: Value(item.frequency),
      duration: Value(item.duration),
      instructions: Value(item.instructions),
      notes: Value(item.notes),
    );
  }

  entity.PrescriptionTemplate _toDomainTemplate(PrescriptionTemplate row) {
    final now = DateTime.now();
    return entity.PrescriptionTemplate(
      id: row.id,
      name: row.name,
      description: row.notes,
      createdAt: now,
      updatedAt: now,
    );
  }
}
