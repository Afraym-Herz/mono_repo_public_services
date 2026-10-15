import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/user_dao.dart';
import 'package:doctor_clinics_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:doctor_clinics_app/features/auth/domain/entities/user.dart'
    as entity;

/// Concrete Drift implementation of [IAuthDatasource].
class AuthDriftDatasource implements IAuthDatasource {
  final UserDao dao;

  AuthDriftDatasource(this.dao);

  @override
  Future<entity.User?> findByUsername(String username) async {
    final row = await dao.getUserByUsername(username);
    return row == null ? null : _toDomainUser(row);
  }

  @override
  Future<entity.User> insertUser(entity.User user) async {
    final id = await dao.insertUser(
      UsersCompanion(
        username: Value(user.username),
        passwordHash: const Value(''),
        role: Value(user.role),
        createdAt: Value(user.createdAt),
        updatedAt: Value(user.updatedAt),
      ),
    );
    return user.copyWith(id: id);
  }

  @override
  Future<void> updateUser(entity.User user) async {
    await dao.updateUser(
      UsersCompanion(
        id: Value(user.id),
        username: Value(user.username),
        role: Value(user.role),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<List<entity.User>> fetchAllUsers() async {
    final rows = await dao.getAllUsers();
    return rows.map(_toDomainUser).toList();
  }

  @override
  Future<int> userCount() async {
    return dao.getUserCount();
  }

  entity.User _toDomainUser(User row) {
    return entity.User(
      id: row.id,
      username: row.username,
      role: row.role,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }
}
