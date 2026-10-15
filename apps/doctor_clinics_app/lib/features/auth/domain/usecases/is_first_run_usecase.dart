import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/auth/domain/repositories/auth_repository.dart';

class IsFirstRunUsecase extends UseCase<bool, NoParams> {
  final IAuthRepository repository;

  IsFirstRunUsecase(this.repository);

  @override
  FutureResult<bool> call(NoParams params) => repository.isFirstRun();
}
