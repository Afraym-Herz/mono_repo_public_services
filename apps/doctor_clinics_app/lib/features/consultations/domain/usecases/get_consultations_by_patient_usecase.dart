import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/consultations/domain/entities/consultation.dart';
import 'package:doctor_clinics_app/features/consultations/domain/repositories/consultation_repository.dart';

class GetConsultationsByPatientUsecase
    extends UseCase<List<Consultation>, ConsultationsByPatientParams> {
  final IConsultationRepository repository;

  GetConsultationsByPatientUsecase(this.repository);

  @override
  FutureResult<List<Consultation>> call(ConsultationsByPatientParams params) =>
      repository.getByPatient(params.patientId);
}

class ConsultationsByPatientParams {
  final int patientId;

  const ConsultationsByPatientParams(this.patientId);
}
