import 'package:doctor_clinics_app/features/consultations/domain/entities/consultation.dart';
import 'package:doctor_clinics_app/features/consultations/domain/entities/vital_signs.dart';

/// Contract for consultation / medical-record operations.
abstract class IConsultationRepository {
  Future<List<Consultation>> getByPatient(int patientId);
  Future<Consultation?> getById(int id);
  Future<Consultation> create(Consultation consultation);
  Future<void> update(Consultation consultation);
  Future<void> finalize(int id);
  Future<void> softDelete(int id);

  //   Vital signs
  Future<VitalSigns?> getVitals(int consultationId);
  Future<void> saveVitals(VitalSigns vitals);
}
