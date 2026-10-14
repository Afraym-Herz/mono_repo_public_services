import 'package:doctor_clinics_app/features/prescriptions/domain/entities/medicine.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_item.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_template.dart';

/// Contract for prescription and medicine operations.
abstract class IPrescriptionRepository {
  //   Medicines
  Future<List<Medicine>> getAllMedicines();
  Future<List<Medicine>> searchMedicines(String query);
  Future<Medicine> addMedicine(Medicine medicine);
  Future<void> updateMedicine(Medicine medicine);
  Future<void> deleteMedicine(int id);

  //   Prescriptions
  Future<List<Prescription>> getByPatient(int patientId);
  Future<Prescription> create(Prescription prescription);
  Future<void> addItem(PrescriptionItem item);
  Future<void> removeItem(int itemId);
  Future<List<PrescriptionItem>> getItems(int prescriptionId);

  //   Templates
  Future<List<PrescriptionTemplate>> getTemplates();
  Future<PrescriptionTemplate> saveTemplate(PrescriptionTemplate template);
  Future<void> deleteTemplate(int id);
}
