import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/consultations/domain/entities/consultation.dart';
import 'package:doctor_clinics_app/features/consultations/domain/entities/vital_signs.dart';

/// Contract for consultation / medical-record operations.
abstract class IConsultationRepository {
  FutureResult<List<Consultation>> getByPatient(int patientId);
  FutureResult<Consultation?> getById(int id);
  FutureResult<Consultation> create(Consultation consultation);
  FutureResult<void> update(Consultation consultation);
  FutureResult<void> finalize(int id);
  FutureResult<void> softDelete(int id);

  //   Vital signs
  FutureResult<VitalSigns?> getVitals(int consultationId);
  FutureResult<void> saveVitals(VitalSigns vitals);
}
