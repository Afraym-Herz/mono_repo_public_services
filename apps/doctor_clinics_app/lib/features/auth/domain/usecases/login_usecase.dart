import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/auth/domain/entities/user.dart';
import 'package:doctor_clinics_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase extends UseCase<User, LoginParams> {
  final IAuthRepository repository;

  LoginUsecase(this.repository);

  @override
  FutureResult<User> call(LoginParams params) =>
      repository.login(params.username, params.password);
}

class LoginParams {
  final String username;
  final String password;

  const LoginParams({required this.username, required this.password});
}
