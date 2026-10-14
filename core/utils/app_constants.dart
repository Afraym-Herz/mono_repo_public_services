// ignore_for_file: constant_identifier_names

class AppConstants {
  AppConstants._();

  // ═══════════════════════════════════════════════════════════════
  // APP INFO
  // ═══════════════════════════════════════════════════════════════
  /// Non-localized fallback. User-facing titles use the `app_name` key so they
  /// follow the active locale.
  static const String appName = 'Agreements';
  static const String fontFamily = 'Ubuntu';
  static const double appVersion = 1.0;

  // ═══════════════════════════════════════════════════════════════
  // SECURE STORAGE KEYS
  // ═══════════════════════════════════════════════════════════════
  static const String TOKEN = 'token';
  static const String USER_INFO = 'user_info';

  // ═══════════════════════════════════════════════════════════════
  // SHARED PREFERENCES KEYS
  // ═══════════════════════════════════════════════════════════════
  static const String THEME = 'theme';
  static const String IS_FIRST_LAUNCH = 'is_first_launch';

  // ═══════════════════════════════════════════════════════════════
  // HIVE BOX NAMES
  // ═══════════════════════════════════════════════════════════════
  static const String settingsBox = 'settings_box';
}
