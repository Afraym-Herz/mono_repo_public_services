import 'package:doctor_clinics_app/features/auth/domain/entities/user.dart';
import 'package:doctor_clinics_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:doctor_clinics_app/features/auth/data/datasources/auth_datasource.dart';

/// Concrete [IAuthRepository] backed by a local datasource.
class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDatasource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<User> login(String username, String password) {
    // TODO: implement â€“ hash password, compare.
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement â€“ clear session.
    throw UnimplementedError();
  }

  @override
  Future<User?> currentUser() {
    // TODO: implement.
    throw UnimplementedError();
  }

  @override
  Future<bool> isLoggedIn() {
    // TODO: implement.
    throw UnimplementedError();
  }

  @override
  Future<User> createFirstUser({
    required String username,
    required String password,
  }) {
    // TODO: implement.
    throw UnimplementedError();
  }

  @override
  Future<bool> isFirstRun() {
    // TODO: implement.
    throw UnimplementedError();
  }
}