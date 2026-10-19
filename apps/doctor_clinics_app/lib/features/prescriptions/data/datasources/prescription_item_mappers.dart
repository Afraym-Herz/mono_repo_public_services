import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_item.dart'
    as entity;
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_template.dart'
    as entity;

/// Row↔entity/companion mapping for the Drift prescription item and template
/// tables. Kept out of [PrescriptionDriftDatasource] so the datasource stays a
/// thin DAO wrapper.
entity.PrescriptionItem toDomainItem(PrescriptionItem row) {
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

PrescriptionItemsCompanion toItemCompanion(entity.PrescriptionItem item) {
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

entity.PrescriptionTemplate toDomainTemplate(PrescriptionTemplate row) {
  final now = DateTime.now();
  return entity.PrescriptionTemplate(
    id: row.id,
    name: row.name,
    description: row.notes,
    createdAt: now,
    updatedAt: now,
  );
}

PrescriptionTemplatesCompanion toTemplateCompanion(
  entity.PrescriptionTemplate template,
) {
  return PrescriptionTemplatesCompanion(
    id: template.id > 0 ? Value(template.id) : const Value.absent(),
    name: Value(template.name),
    notes: Value(template.description),
    itemsJson: const Value('[]'),
  );
}
