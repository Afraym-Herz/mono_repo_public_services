import 'package:doctor_clinics_app/features/consultations/domain/entities/consultation.dart';
import 'package:doctor_clinics_app/features/consultations/domain/entities/vital_signs.dart';

/// Local data-source for consultations (Drift).
abstract class IConsultationDatasource {
  Future<List<Consultation>> fetchByPatient(int patientId);
  Future<Consultation?> fetchById(int id);
  Future<int> insert(Consultation consultation);
  Future<void> update(Consultation consultation);
  Future<void> softDelete(int id);

  Future<VitalSigns?> fetchVitals(int consultationId);
  Future<void> upsertVitals(VitalSigns vitals);
}