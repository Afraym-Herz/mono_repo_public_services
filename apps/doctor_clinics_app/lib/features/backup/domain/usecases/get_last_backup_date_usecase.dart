import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/backup/domain/repositories/backup_repository.dart';

class GetLastBackupDateUsecase extends UseCase<DateTime?, NoParams> {
  final IBackupRepository repository;

  GetLastBackupDateUsecase(this.repository);

  @override
  FutureResult<DateTime?> call(NoParams params) =>
      repository.lastBackupDate();
}
