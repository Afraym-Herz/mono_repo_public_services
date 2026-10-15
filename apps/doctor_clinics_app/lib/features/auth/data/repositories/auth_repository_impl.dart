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
  static const _sessionKey = 'auth_session_user_id';

  AuthRepositoryImpl({required this.datasource});

  @override
  FutureResult<User> login(String username, String password) async {
    try {
      final user = await datasource.findByUsername(username);
      if (user == null) {
        return const Left(CacheFailure('Invalid username or password'));
      }
      await getIt<SecureStorageService>().writeSecureData(
        _sessionKey,
        user.id.toString(),
      );
      return Right(user);
    } catch (e) {
      return Left(CacheFailure('auth.login failed: $e'));
    }
  }

  /// Core contract: ends the session (clears backend session + storage).
  @override
  Future<void> logout() async {
    await getIt<SecureStorageService>().deleteSecureData(_sessionKey);
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
      final res =
          await getIt<SecureStorageService>().readSecureData(_sessionKey);
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
      final savedUser = await datasource.insertUser(user);
      await getIt<SecureStorageService>().writeSecureData(
        _sessionKey,
        savedUser.id.toString(),
      );
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
