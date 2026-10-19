import 'dart:convert';

import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/auth/domain/entities/user.dart';

/// Owns the persisted session keys for the auth repository.
///
/// Both [AuthRepositoryImpl] (`currentAppUser`) and the shared [AppAuthCubit]
/// (which drives router redirection and reads [AppConstants.TOKEN] /
/// [AppConstants.USER_INFO] before `runApp`) read these keys, so writes live in
/// one place to keep them in sync across restarts.
class AuthSessionStore {
  AuthSessionStore._();

  /// Key holding the signed-in app [User] id.
  static const String sessionKey = 'auth_session_user_id';

  /// Persists the active session so both the repository and the shared
  /// [AppAuthCubit] agree on the signed-in state across restarts.
  static Future<void> persist(User user) async {
    final storage = getIt<SecureStorageService>();
    await storage.writeSecureData(sessionKey, user.id.toString());
    await storage.writeSecureData(AppConstants.TOKEN, user.id.toString());
    await storage.writeSecureData(
      AppConstants.USER_INFO,
      jsonEncode(user.toAuthUser().toMap()),
    );
  }

  /// Clears every session key written by [persist].
  static Future<void> clear() async {
    final storage = getIt<SecureStorageService>();
    await storage.deleteSecureData(sessionKey);
    await storage.deleteSecureData(AppConstants.TOKEN);
    await storage.deleteSecureData(AppConstants.USER_INFO);
  }
}
