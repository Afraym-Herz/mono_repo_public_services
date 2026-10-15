import 'package:doctor_clinics_app/core/database/daos/user_dao.dart';
import 'package:doctor_clinics_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:doctor_clinics_app/features/auth/domain/entities/user.dart';

/// Drift-backed stub of [IAuthDatasource].
class AuthDriftDatasource implements IAuthDatasource {
  final UserDao dao;
  AuthDriftDatasource(this.dao);

  @override
  Future<User?> findByUsername(String username) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<User> insertUser(User user) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(User user) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<List<User>> fetchAllUsers() async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> userCount() async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }
}
