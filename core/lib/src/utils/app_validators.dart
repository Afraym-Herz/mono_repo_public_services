import 'package:easy_localization/easy_localization.dart';

/// Centralised validation rules used across all features.
///
/// Usage:
/// ```dart
/// validator: AppValidators.required
/// validator: AppValidators.number
/// validator: AppValidators.compose([AppValidators.required, AppValidators.number])
/// ```
abstract final class AppValidators {
  // ─── Primitive rules ────────────────────────────────────────────────────────

  /// Field must not be null or blank.
  static String? required(String? v) =>
      (v == null || v.trim().isEmpty) ? 'field_required'.tr() : null;

  /// Field must be a valid integer.
  static String? number(String? v) {
    if (v == null || v.trim().isEmpty) return 'field_required'.tr();
    if (int.tryParse(v.trim()) == null) return 'invalid_number'.tr();
    return null;
  }

  /// Field must be a valid decimal number.
  static String? decimal(String? v) {
    if (v == null || v.trim().isEmpty) return 'field_required'.tr();
    if (double.tryParse(v.trim()) == null) return 'invalid_number'.tr();
    return null;
  }

  /// Field must be a valid e-mail address.
  static String? email(String? v) {
    if (v == null || v.trim().isEmpty) return 'field_required'.tr();
    final emailRegex = RegExp(r'^[\w\-.]+@([\w\-]+\.)+[\w\-]{2,}$');
    if (!emailRegex.hasMatch(v.trim())) return 'invalid_email'.tr();
    return null;
  }

  // ─── Parameterised factories ────────────────────────────────────────────────

  /// Field must be at least [min] characters long.
  static String? Function(String?) minLength(int min) => (v) {
    if (v == null || v.isEmpty) return 'field_required'.tr();
    if (v.length < min) {
      return 'min_length'.tr(namedArgs: {'count': '$min'});
    }
    return null;
  };

  /// Field must not exceed [max] characters.
  static String? Function(String?) maxLength(int max) => (v) {
    if (v != null && v.length > max) {
      return 'max_length'.tr(namedArgs: {'count': '$max'});
    }
    return null;
  };

  // ─── Composer ───────────────────────────────────────────────────────────────

  /// Runs [rules] in order and returns the first error found.
  ///
  /// ```dart
  /// validator: AppValidators.compose([
  ///   AppValidators.required,
  ///   AppValidators.minLength(8),
  /// ])
  /// ```
  static String? Function(String?) compose(
    List<String? Function(String?)> rules,
  ) => (v) {
    for (final rule in rules) {
      final error = rule(v);
      if (error != null) return error;
    }
    return null;
  };
}
