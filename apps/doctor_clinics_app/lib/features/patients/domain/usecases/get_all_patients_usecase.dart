import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

class GetAllPatientsUsecase extends UseCase<List<Patient>, NoParams> {
  final PatientRepository repository;

  GetAllPatientsUsecase(this.repository);

  @override
  FutureResult<List<Patient>> call(NoParams params) =>
      repository.getAllPatients();
}
