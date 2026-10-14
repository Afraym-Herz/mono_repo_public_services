import 'package:doctor_clinics_app/features/prescriptions/domain/entities/medicine.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_item.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_template.dart';

/// Local data-source for prescriptions (Drift).
abstract class IPrescriptionDatasource {
  Future<List<Medicine>> fetchAllMedicines();
  Future<List<Medicine>> searchMedicines(String query);
  Future<int> insertMedicine(Medicine medicine);
  Future<void> updateMedicine(Medicine medicine);
  Future<void> softDeleteMedicine(int id);

  Future<List<Prescription>> fetchByPatient(int patientId);
  Future<int> insertPrescription(Prescription prescription);
  Future<void> insertItem(PrescriptionItem item);
  Future<void> deleteItem(int itemId);
  Future<List<PrescriptionItem>> fetchItems(
    int prescriptionId,
  );

  Future<List<PrescriptionTemplate>> fetchTemplates();
  Future<int> insertTemplate(PrescriptionTemplate template);
  Future<void> deleteTemplate(int id);
}