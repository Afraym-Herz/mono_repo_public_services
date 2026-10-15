import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/users_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<User?> getUserByUsername(String username) =>
      (select(users)..where((u) => u.username.equals(username))).getSingleOrNull();
  Future<int> insertUser(UsersCompanion entry) => into(users).insert(entry);
  Future<List<User>> getAllUsers() => select(users).get();
}
