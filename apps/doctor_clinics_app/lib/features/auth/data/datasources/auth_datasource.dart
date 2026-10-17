import 'package:doctor_clinics_app/features/auth/domain/entities/user.dart';

/// The stored credentials needed to authenticate a local account.
///
/// Kept at the datasource boundary so the domain [User] never exposes the
/// password hash to the UI.
class AuthCredentials {
  const AuthCredentials({required this.user, required this.passwordHash});

  final User user;
  final String passwordHash;
}

/// Local data-source contract for auth (backed by Drift).
abstract class IAuthDatasource {
  Future<AuthCredentials?> findCredentialsByUsername(String username);
  Future<User> insertUser(User user, {required String passwordHash});
  Future<void> updateUser(User user);
  Future<List<User>> fetchAllUsers();
  Future<int> userCount();
}
