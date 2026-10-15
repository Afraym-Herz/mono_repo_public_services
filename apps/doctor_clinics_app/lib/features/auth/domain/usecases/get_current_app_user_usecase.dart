import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/auth/domain/entities/user.dart';
import 'package:doctor_clinics_app/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentAppUserUsecase extends UseCase<User?, NoParams> {
  final IAuthRepository repository;

  GetCurrentAppUserUsecase(this.repository);

  @override
  FutureResult<User?> call(NoParams params) => repository.currentAppUser();
}
