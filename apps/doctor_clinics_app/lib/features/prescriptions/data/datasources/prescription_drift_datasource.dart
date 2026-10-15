import 'package:doctor_clinics_app/core/database/daos/prescription_dao.dart';
import 'package:doctor_clinics_app/features/prescriptions/data/datasources/prescription_datasource.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/medicine.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_item.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_template.dart';

/// Drift-backed stub of [IPrescriptionDatasource].
class PrescriptionDriftDatasource implements IPrescriptionDatasource {
  final PrescriptionDao dao;
  PrescriptionDriftDatasource(this.dao);

  @override
  Future<List<Medicine>> fetchAllMedicines() async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<List<Medicine>> searchMedicines(String query) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> insertMedicine(Medicine medicine) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> updateMedicine(Medicine medicine) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> softDeleteMedicine(int id) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<List<Prescription>> fetchByPatient(int patientId) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> insertPrescription(Prescription prescription) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> insertItem(PrescriptionItem item) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItem(int itemId) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<List<PrescriptionItem>> fetchItems(int prescriptionId) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<List<PrescriptionTemplate>> fetchTemplates() async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> insertTemplate(PrescriptionTemplate template) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTemplate(int id) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }
}
