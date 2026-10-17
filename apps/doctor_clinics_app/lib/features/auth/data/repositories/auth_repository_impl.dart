import 'dart:convert';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/auth/domain/entities/user.dart';
import 'package:doctor_clinics_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:doctor_clinics_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:doctor_clinics_app/features/auth/data/helpers/password_hasher.dart';

/// Concrete [IAuthRepository] backed by a local datasource.
///
/// Also implements core [AuthRepository] by mapping [User] ↔ [AuthUser] at
/// the boundary, so `getIt<AuthRepository>()` never throws at runtime.
class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDatasource datasource;
  static const _sessionKey = 'auth_session_user_id';

  AuthRepositoryImpl({required this.datasource});

  /// Persists the active session so both this repository (`currentAppUser`)
  /// and the shared [AppAuthCubit] (which drives router redirection and reads
  /// [AppConstants.TOKEN] / [AppConstants.USER_INFO] before `runApp`) agree
  /// on the signed-in state across restarts.
  Future<void> _persistSession(User user) async {
    final storage = getIt<SecureStorageService>();
    await storage.writeSecureData(_sessionKey, user.id.toString());
    await storage.writeSecureData(AppConstants.TOKEN, user.id.toString());
    await storage.writeSecureData(
      AppConstants.USER_INFO,
      jsonEncode(user.toAuthUser().toMap()),
    );
  }

  /// Clears every session key written by [_persistSession].
  Future<void> _clearSession() async {
    final storage = getIt<SecureStorageService>();
    await storage.deleteSecureData(_sessionKey);
    await storage.deleteSecureData(AppConstants.TOKEN);
    await storage.deleteSecureData(AppConstants.USER_INFO);
  }

  @override
  FutureResult<User> login(String username, String password) async {
    try {
      final credentials = await datasource.findCredentialsByUsername(username);
      if (credentials == null ||
          !PasswordHasher.verify(password, credentials.passwordHash)) {
        return const Left(CacheFailure('Invalid username or password'));
      }
      final user = credentials.user;
      await _persistSession(user);
      return Right(user);
    } catch (e) {
      return Left(CacheFailure('auth.login failed: $e'));
    }
  }

  /// Core contract: ends the session (clears backend session + storage).
  @override
  Future<void> logout() async {
    await _clearSession();
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
      final res = await getIt<SecureStorageService>().readSecureData(
        _sessionKey,
      );
      final userIdStr = res.fold((_) => null, (val) => val);
      if (userIdStr == null) return const Right(null);
      final userId = int.tryParse(userIdStr);
      if (userId == null) return const Right(null);
      final users = await datasource.fetchAllUsers();
      final user = users.cast<User?>().firstWhere(
        (u) => u?.id == userId,
        orElse: () => null,
      );
      return Right(user);
    } catch (e) {
      return Left(CacheFailure('auth.currentAppUser failed: $e'));
    }
  }

  @override
  FutureResult<bool> isLoggedIn() async {
    try {
      final userResult = await currentAppUser();
      return Right(userResult.fold((_) => false, (user) => user != null));
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
      final now = DateTime.now();
      final user = User(
        id: 0,
        username: username,
        role: 'doctor',
        createdAt: now,
        updatedAt: now,
      );
      final savedUser = await datasource.insertUser(
        user,
        passwordHash: PasswordHasher.hash(password),
      );
      await _persistSession(savedUser);
      return Right(savedUser);
    } catch (e) {
      return Left(CacheFailure('auth.createFirstUser failed: $e'));
    }
  }

  @override
  FutureResult<bool> isFirstRun() async {
    try {
      final count = await datasource.userCount();
      return Right(count == 0);
    } catch (e) {
      return Left(CacheFailure('auth.isFirstRun failed: $e'));
    }
  }
}
