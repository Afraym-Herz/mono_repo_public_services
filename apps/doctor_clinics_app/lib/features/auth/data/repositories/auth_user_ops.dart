import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:doctor_clinics_app/features/auth/data/helpers/auth_session_store.dart';
import 'package:doctor_clinics_app/features/auth/domain/entities/user.dart';

/// Session-derived user queries mixed into the concrete auth repository.
mixin AuthUserOps {
  /// Local datasource supplied by the concrete repository.
  IAuthDatasource get datasource;

  /// Core contract: app [User] mapped to shared [AuthUser].
  Future<AuthUser?> currentUser() async {
    final result = await currentAppUser();
    return result.fold((_) => null, (user) => user?.toAuthUser());
  }

  FutureResult<User?> currentAppUser() async {
    try {
      final res = await getIt<SecureStorageService>().readSecureData(
        AuthSessionStore.sessionKey,
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

  FutureResult<bool> isLoggedIn() async {
    try {
      final userResult = await currentAppUser();
      return Right(userResult.fold((_) => false, (user) => user != null));
    } catch (e) {
      return Left(CacheFailure('auth.isLoggedIn failed: $e'));
    }
  }
}
