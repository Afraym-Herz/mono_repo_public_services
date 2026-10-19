import 'package:doctor_clinics_app/core/database/daos/prescription_dao.dart';
import 'package:doctor_clinics_app/features/prescriptions/data/datasources/prescription_datasource.dart';
import 'package:doctor_clinics_app/features/prescriptions/data/datasources/prescription_item_mappers.dart';
import 'package:doctor_clinics_app/features/prescriptions/data/datasources/prescription_mappers.dart';
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
    return rows.map(toDomainMedicine).toList();
  }

  @override
  Future<List<entity.Medicine>> searchMedicines(String query) async {
    final rows = await dao.searchMedicines(query);
    return rows.map(toDomainMedicine).toList();
  }

  @override
  Future<int> insertMedicine(entity.Medicine medicine) async {
    return dao.insertMedicine(toMedicineCompanion(medicine));
  }

  @override
  Future<void> updateMedicine(entity.Medicine medicine) async {
    await dao.updateMedicine(toMedicineCompanion(medicine));
  }

  @override
  Future<void> softDeleteMedicine(int id) async {
    await dao.deleteMedicine(id);
  }

  @override
  Future<List<entity.Prescription>> fetchByPatient(int patientId) async {
    final rows = await dao.getPrescriptionsForPatient(patientId);
    return rows.map(toDomainPrescription).toList();
  }

  @override
  Future<int> insertPrescription(entity.Prescription prescription) async {
    return dao.insertPrescription(toPrescriptionCompanion(prescription));
  }

  @override
  Future<void> insertItem(entity.PrescriptionItem item) async {
    await dao.insertPrescriptionItem(toItemCompanion(item));
  }

  @override
  Future<void> deleteItem(int itemId) async {
    await dao.deletePrescriptionItem(itemId);
  }

  @override
  Future<List<entity.PrescriptionItem>> fetchItems(int prescriptionId) async {
    final rows = await dao.getPrescriptionItems(prescriptionId);
    return rows.map(toDomainItem).toList();
  }

  @override
  Future<List<entity.PrescriptionTemplate>> fetchTemplates() async {
    final rows = await dao.getAllTemplates();
    return rows.map(toDomainTemplate).toList();
  }

  @override
  Future<int> insertTemplate(entity.PrescriptionTemplate template) async {
    return dao.insertTemplate(toTemplateCompanion(template));
  }

  @override
  Future<void> deleteTemplate(int id) async {
    await dao.deleteTemplate(id);
  }
}
