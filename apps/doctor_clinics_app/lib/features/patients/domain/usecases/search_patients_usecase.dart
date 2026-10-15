import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

class SearchPatientsUsecase extends UseCase<List<Patient>, SearchPatientsParams> {
  final PatientRepository repository;

  SearchPatientsUsecase(this.repository);

  @override
  FutureResult<List<Patient>> call(SearchPatientsParams params) {
    final query = params.query.trim().toLowerCase();
    return repository.getAllPatients().then(
          (either) => either.map(
            (patients) => query.isEmpty
                ? patients
                : patients
                    .where(
                      (p) =>
                          p.searchText.toLowerCase().contains(query) ||
                          p.fullName.toLowerCase().contains(query) ||
                          p.fileNumber.toLowerCase().contains(query) ||
                          (p.phone?.toLowerCase().contains(query) ?? false),
                    )
                    .toList(),
          ),
        );
  }
}

class SearchPatientsParams {
  final String query;

  const SearchPatientsParams(this.query);
}
