import 'package:core/src/auth/auth_user.dart';

/// Contract every app's auth feature must implement and register in `getIt`.
///
/// `core` only programs against this abstraction (e.g. [HeaderLogoutButton]),
/// never against a concrete feature repository.
abstract class AuthRepository {
  Future<void> logout();
  Future<AuthUser?> currentUser();
}
