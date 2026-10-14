import 'package:doctor_clinics_app/features/auth/domain/entities/user.dart';

/// Contract for authentication operations.
abstract class IAuthRepository {
  /// Authenticates with [username] and [password].
  /// Returns the authenticated [User] or throws.
  Future<User> login(String username, String password);

  /// Ends the current session.
  Future<void> logout();

  /// Returns the currently authenticated user, if any.
  Future<User?> currentUser();

  /// Whether a session is active.
  Future<bool> isLoggedIn();

  /// Creates the first admin user during initial setup.
  Future<User> createFirstUser({
    required String username,
    required String password,
  });

  /// Returns `true` when no users exist yet (first-run).
  Future<bool> isFirstRun();
}