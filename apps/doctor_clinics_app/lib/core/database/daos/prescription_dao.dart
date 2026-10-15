import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/prescriptions_table.dart';

part 'prescription_dao.g.dart';

@DriftAccessor(tables: [Medicines, MedicinePresets, Prescriptions, PrescriptionItems, PrescriptionTemplates])
class PrescriptionDao extends DatabaseAccessor<AppDatabase> with _$PrescriptionDaoMixin {
  PrescriptionDao(super.db);

  Future<List<Medicine>> getAllMedicines() => select(medicines).get();
  Future<int> insertMedicine(MedicinesCompanion entry) => into(medicines).insert(entry);

  Future<List<Prescription>> getPrescriptionsForPatient(int patientId) =>
      (select(prescriptions)..where((p) => p.patientId.equals(patientId))).get();
  Future<int> insertPrescription(PrescriptionsCompanion entry) => into(prescriptions).insert(entry);

  Future<List<PrescriptionItem>> getPrescriptionItems(int prescriptionId) =>
      (select(prescriptionItems)..where((i) => i.prescriptionId.equals(prescriptionId))).get();
  Future<int> insertPrescriptionItem(PrescriptionItemsCompanion entry) => into(prescriptionItems).insert(entry);

  Future<List<PrescriptionTemplate>> getAllTemplates() => select(prescriptionTemplates).get();
  Future<int> insertTemplate(PrescriptionTemplatesCompanion entry) => into(prescriptionTemplates).insert(entry);
}
