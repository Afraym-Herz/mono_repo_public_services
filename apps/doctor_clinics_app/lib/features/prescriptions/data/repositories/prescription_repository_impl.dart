import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/prescriptions/data/datasources/prescription_datasource.dart';
import 'package:doctor_clinics_app/features/prescriptions/data/repositories/prescription_repository_guard.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/medicine.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_item.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_template.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/repositories/prescription_repository.dart';

class PrescriptionRepositoryImpl implements IPrescriptionRepository {
  final IPrescriptionDatasource datasource;

  PrescriptionRepositoryImpl({required this.datasource});

  @override
  FutureResult<List<Medicine>> getAllMedicines() =>
      guardPrescription('getAllMedicines', datasource.fetchAllMedicines);

  @override
  FutureResult<List<Medicine>> searchMedicines(String query) =>
      guardPrescription(
        'searchMedicines',
        () => datasource.searchMedicines(query),
      );

  @override
  FutureResult<Medicine> addMedicine(Medicine medicine) => guardPrescription(
        'addMedicine',
        () async {
          final id = await datasource.insertMedicine(medicine);
          return medicine.copyWith(id: id);
        },
      );

  @override
  FutureResult<void> updateMedicine(Medicine medicine) =>
      guardPrescriptionVoid('updateMedicine', () => datasource.updateMedicine(medicine));

  @override
  FutureResult<void> deleteMedicine(int id) =>
      guardPrescriptionVoid('deleteMedicine', () => datasource.softDeleteMedicine(id));

  @override
  FutureResult<List<Prescription>> getByPatient(int patientId) =>
      guardPrescription('getByPatient', () => datasource.fetchByPatient(patientId));

  @override
  FutureResult<Prescription> create(Prescription prescription) =>
      guardPrescription(
        'create',
        () async {
          final id = await datasource.insertPrescription(prescription);
          return prescription.copyWith(id: id);
        },
      );

  @override
  FutureResult<void> addItem(PrescriptionItem item) =>
      guardPrescriptionVoid('addItem', () => datasource.insertItem(item));

  @override
  FutureResult<void> removeItem(int itemId) =>
      guardPrescriptionVoid('removeItem', () => datasource.deleteItem(itemId));

  @override
  FutureResult<List<PrescriptionItem>> getItems(int prescriptionId) =>
      guardPrescription('getItems', () => datasource.fetchItems(prescriptionId));

  @override
  FutureResult<List<PrescriptionTemplate>> getTemplates() =>
      guardPrescription('getTemplates', datasource.fetchTemplates);

  @override
  FutureResult<PrescriptionTemplate> saveTemplate(
    PrescriptionTemplate template,
  ) =>
      guardPrescription(
        'saveTemplate',
        () async {
          final id = await datasource.insertTemplate(template);
          return template.copyWith(id: id);
        },
      );

  @override
  FutureResult<void> deleteTemplate(int id) =>
      guardPrescriptionVoid('deleteTemplate', () => datasource.deleteTemplate(id));
}
