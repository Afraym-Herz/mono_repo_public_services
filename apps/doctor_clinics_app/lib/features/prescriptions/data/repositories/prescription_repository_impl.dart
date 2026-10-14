import 'package:doctor_clinics_app/features/prescriptions/domain/entities/medicine.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_item.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_template.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/repositories/prescription_repository.dart';
import 'package:doctor_clinics_app/features/prescriptions/data/datasources/prescription_datasource.dart';

class PrescriptionRepositoryImpl implements IPrescriptionRepository {
  final IPrescriptionDatasource datasource;

  PrescriptionRepositoryImpl({required this.datasource});

  @override
  Future<List<Medicine>> getAllMedicines() {
    throw UnimplementedError();
  }

  @override
  Future<List<Medicine>> searchMedicines(String query) {
    throw UnimplementedError();
  }

  @override
  Future<Medicine> addMedicine(Medicine medicine) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateMedicine(Medicine medicine) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMedicine(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Prescription>> getByPatient(int patientId) {
    throw UnimplementedError();
  }

  @override
  Future<Prescription> create(Prescription prescription) {
    throw UnimplementedError();
  }

  @override
  Future<void> addItem(PrescriptionItem item) {
    throw UnimplementedError();
  }

  @override
  Future<void> removeItem(int itemId) {
    throw UnimplementedError();
  }

  @override
  Future<List<PrescriptionItem>> getItems(int prescriptionId) {
    throw UnimplementedError();
  }

  @override
  Future<List<PrescriptionTemplate>> getTemplates() {
    throw UnimplementedError();
  }

  @override
  Future<PrescriptionTemplate> saveTemplate(
    PrescriptionTemplate template,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTemplate(int id) {
    throw UnimplementedError();
  }
}