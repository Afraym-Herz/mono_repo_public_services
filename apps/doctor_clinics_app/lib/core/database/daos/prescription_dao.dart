import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/prescriptions_table.dart';

part 'prescription_dao.g.dart';

@DriftAccessor(tables: [Medicines, MedicinePresets, Prescriptions, PrescriptionItems, PrescriptionTemplates])
class PrescriptionDao extends DatabaseAccessor<AppDatabase> with _$PrescriptionDaoMixin {
  PrescriptionDao(super.db);

  Future<List<Medicine>> getAllMedicines() =>
      (select(medicines)..where((m) => m.isActive.equals(true))).get();
  Future<List<Medicine>> searchMedicines(String query) => (select(medicines)
        ..where((m) =>
            m.isActive.equals(true) &
            (m.name.contains(query) |
                m.searchText.contains(query) |
                m.alias.contains(query))))
      .get();
  Future<int> insertMedicine(MedicinesCompanion entry) => into(medicines).insert(entry);
  Future<bool> updateMedicine(MedicinesCompanion entry) => update(medicines).replace(entry);
  Future<int> deleteMedicine(int id) =>
      (update(medicines)..where((m) => m.id.equals(id)))
          .write(const MedicinesCompanion(isActive: Value(false)));

  Future<List<Prescription>> getPrescriptionsForPatient(int patientId) =>
      (select(prescriptions)..where((p) => p.patientId.equals(patientId))).get();
  Future<int> insertPrescription(PrescriptionsCompanion entry) => into(prescriptions).insert(entry);

  Future<List<PrescriptionItem>> getPrescriptionItems(int prescriptionId) =>
      (select(prescriptionItems)..where((i) => i.prescriptionId.equals(prescriptionId))).get();
  Future<int> insertPrescriptionItem(PrescriptionItemsCompanion entry) => into(prescriptionItems).insert(entry);
  Future<int> deletePrescriptionItem(int id) =>
      (delete(prescriptionItems)..where((i) => i.id.equals(id))).go();

  Future<List<PrescriptionTemplate>> getAllTemplates() => select(prescriptionTemplates).get();
  Future<int> insertTemplate(PrescriptionTemplatesCompanion entry) => into(prescriptionTemplates).insert(entry);
  Future<int> deleteTemplate(int id) =>
      (delete(prescriptionTemplates)..where((t) => t.id.equals(id))).go();
}
