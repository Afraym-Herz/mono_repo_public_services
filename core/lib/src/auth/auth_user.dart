import 'package:equatable/equatable.dart';

/// Minimal shared user entity.
///
/// Lives in `core` so every app + [AppAuthCubit] can share the same auth
/// state type without depending on a specific feature package.
///
/// Apps with richer user models should extend/mirror this class or map
/// their own entity to/from it at the repository boundary.
class AuthUser extends Equatable {
  const AuthUser({
    required this.id,
    required this.name,
    this.email,
    this.role,
  });

  final String id;
  final String name;
  final String? email;

  /// Optional role token (e.g. `secretary`, `doctor`, `admin`) used for
  /// display chrome such as the workspace top bar. Apps decide the vocabulary.
  final String? role;

  factory AuthUser.fromMap(Map<String, dynamic> map) => AuthUser(
    id: map['id']?.toString() ?? '',
    name: map['name']?.toString() ?? '',
    email: map['email']?.toString(),
    role: map['role']?.toString(),
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'email': email,
    'role': role,
  };

  @override
  List<Object?> get props => [id, name, email, role];
}
