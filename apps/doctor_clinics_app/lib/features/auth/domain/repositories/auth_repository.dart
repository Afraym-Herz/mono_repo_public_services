import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/auth/domain/entities/user.dart';

/// App-owned auth contract. Extends core [AuthRepository] so `core` widgets
/// (e.g. `HeaderLogoutButton`) can resolve it via `getIt<AuthRepository>`.
///
/// Core-owned members (`logout`, `currentUser` → [AuthUser]) are inherited;
/// app-specific members below work with the app-owned [User] and are mapped
/// to/from [AuthUser] at the repository boundary.
abstract class IAuthRepository implements AuthRepository {
  /// Authenticates with [username] and [password].
  /// Returns the authenticated [User] or a [Failure].
  FutureResult<User> login(String username, String password);

  /// Returns the app-typed current user, if any.
  FutureResult<User?> currentAppUser();

  /// Whether a session is active.
  FutureResult<bool> isLoggedIn();

  /// Creates the first admin user during initial setup.
  FutureResult<User> createFirstUser({
    required String username,
    required String password,
  });

  /// Returns `true` when no users exist yet (first-run).
  FutureResult<bool> isFirstRun();
}
