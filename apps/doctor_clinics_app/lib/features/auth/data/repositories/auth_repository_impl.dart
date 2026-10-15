import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/auth/domain/entities/user.dart';
import 'package:doctor_clinics_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:doctor_clinics_app/features/auth/data/datasources/auth_datasource.dart';

/// Concrete [IAuthRepository] backed by a local datasource.
///
/// Also implements core [AuthRepository] by mapping [User] ↔ [AuthUser] at
/// the boundary, so `getIt<AuthRepository>()` never throws at runtime.
class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDatasource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  FutureResult<User> login(String username, String password) async {
    try {
      // TODO: implement – hash password, compare.
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('auth.login failed: $e'));
    }
  }

  /// Core contract: ends the session (clears backend session + storage).
  @override
  Future<void> logout() {
    // TODO: implement – clear session.
    throw UnimplementedError();
  }

  /// Core contract: app [User] mapped to shared [AuthUser].
  @override
  Future<AuthUser?> currentUser() async {
    final result = await currentAppUser();
    return result.fold((_) => null, (user) => user?.toAuthUser());
  }

  @override
  FutureResult<User?> currentAppUser() async {
    try {
      // TODO: implement.
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('auth.currentAppUser failed: $e'));
    }
  }

  @override
  FutureResult<bool> isLoggedIn() async {
    try {
      // TODO: implement.
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('auth.isLoggedIn failed: $e'));
    }
  }

  @override
  FutureResult<User> createFirstUser({
    required String username,
    required String password,
  }) async {
    try {
      // TODO: implement.
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('auth.createFirstUser failed: $e'));
    }
  }

  @override
  FutureResult<bool> isFirstRun() async {
    try {
      // TODO: implement.
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('auth.isFirstRun failed: $e'));
    }
  }
}
