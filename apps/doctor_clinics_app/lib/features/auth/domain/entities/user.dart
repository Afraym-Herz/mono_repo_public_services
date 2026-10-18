import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String username,
    required String role,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

/// Repository-boundary mapper between the app-owned [User] and core [AuthUser].
///
/// Per CLAUDE.md §3: `core` owns `AuthUser`; each app maps its own user
/// model to/from it here, never importing `features/` from `core`.
extension UserAuthMapper on User {
  AuthUser toAuthUser() =>
      AuthUser(id: id.toString(), name: username, role: role);

  static User fromAuthUser(AuthUser authUser, {String role = 'secretary'}) {
    final now = DateTime.now();
    return User(
      id: int.tryParse(authUser.id) ?? 0,
      username: authUser.name,
      role: authUser.role ?? role,
      createdAt: now,
      updatedAt: now,
    );
  }
}
