import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:doctor_clinics_app/features/auth/data/helpers/auth_session_store.dart';
import 'package:doctor_clinics_app/features/auth/data/helpers/password_hasher.dart';
import 'package:doctor_clinics_app/features/auth/domain/entities/user.dart';

/// Credential and session operations mixed into the concrete auth repository.
mixin AuthLoginOps {
  /// Local datasource supplied by the concrete repository.
  IAuthDatasource get datasource;

  FutureResult<User> login(String username, String password) async {
    try {
      final credentials = await datasource.findCredentialsByUsername(username);
      if (credentials == null ||
          !PasswordHasher.verify(password, credentials.passwordHash)) {
        return const Left(CacheFailure('Invalid username or password'));
      }
      final user = credentials.user;
      await AuthSessionStore.persist(user);
      return Right(user);
    } catch (e) {
      return Left(CacheFailure('auth.login failed: $e'));
    }
  }

  /// Core contract: ends the session (clears backend session + storage).
  Future<void> logout() async {
    await AuthSessionStore.clear();
  }

  FutureResult<User> createFirstUser({
    required String username,
    required String password,
  }) async {
    try {
      final now = DateTime.now();
      final user = User(
        id: 0,
        username: username,
        role: AppConstants.userRoleDoctor,
        createdAt: now,
        updatedAt: now,
      );
      final savedUser = await datasource.insertUser(
        user,
        passwordHash: PasswordHasher.hash(password),
      );
      await AuthSessionStore.persist(savedUser);
      return Right(savedUser);
    } catch (e) {
      return Left(CacheFailure('auth.createFirstUser failed: $e'));
    }
  }

  FutureResult<bool> isFirstRun() async {
    try {
      final count = await datasource.userCount();
      return Right(count == 0);
    } catch (e) {
      return Left(CacheFailure('auth.isFirstRun failed: $e'));
    }
  }
}
