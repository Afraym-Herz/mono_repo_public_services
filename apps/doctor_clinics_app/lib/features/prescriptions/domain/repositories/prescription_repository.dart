import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/medicine.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_item.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_template.dart';

/// Contract for prescription and medicine operations.
abstract class IPrescriptionRepository {
  //   Medicines
  FutureResult<List<Medicine>> getAllMedicines();
  FutureResult<List<Medicine>> searchMedicines(String query);
  FutureResult<Medicine> addMedicine(Medicine medicine);
  FutureResult<void> updateMedicine(Medicine medicine);
  FutureResult<void> deleteMedicine(int id);

  //   Prescriptions
  FutureResult<List<Prescription>> getByPatient(int patientId);
  FutureResult<Prescription> create(Prescription prescription);
  FutureResult<void> addItem(PrescriptionItem item);
  FutureResult<void> removeItem(int itemId);
  FutureResult<List<PrescriptionItem>> getItems(int prescriptionId);

  //   Templates
  FutureResult<List<PrescriptionTemplate>> getTemplates();
  FutureResult<PrescriptionTemplate> saveTemplate(
    PrescriptionTemplate template,
  );
  FutureResult<void> deleteTemplate(int id);
}
