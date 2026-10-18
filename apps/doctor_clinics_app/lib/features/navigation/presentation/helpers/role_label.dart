import 'package:easy_localization/easy_localization.dart';

/// Resolves a role token (e.g. `secretary`) to a localized label.
///
/// Falls back to `header.user_fallback_role`, then to the raw token, so unknown
/// roles never render as an empty string.
String roleLabel(String? role) {
  if (role == null || role.trim().isEmpty) {
    return 'header.user_fallback_role'.tr();
  }
  final token = role.trim().toLowerCase();
  final key = 'role_$token';
  final label = key.tr();
  return label == key ? role : label;
}
