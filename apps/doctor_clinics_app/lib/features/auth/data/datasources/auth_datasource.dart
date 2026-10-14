import 'package:doctor_clinics_app/features/auth/domain/entities/user.dart';

/// Local data-source contract for auth (backed by Drift).
abstract class IAuthDatasource {
  Future<User?> findByUsername(String username);
  Future<User> insertUser(User user);
  Future<void> updateUser(User user);
  Future<List<User>> fetchAllUsers();
  Future<int> userCount();
}