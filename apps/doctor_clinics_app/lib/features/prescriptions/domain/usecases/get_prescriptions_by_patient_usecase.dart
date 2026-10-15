import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/repositories/prescription_repository.dart';

class GetPrescriptionsByPatientUsecase
    extends UseCase<List<Prescription>, PrescriptionsByPatientParams> {
  final IPrescriptionRepository repository;

  GetPrescriptionsByPatientUsecase(this.repository);

  @override
  FutureResult<List<Prescription>> call(PrescriptionsByPatientParams params) =>
      repository.getByPatient(params.patientId);
}

class PrescriptionsByPatientParams {
  final int patientId;

  const PrescriptionsByPatientParams(this.patientId);
}
