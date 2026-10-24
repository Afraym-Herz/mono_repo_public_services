import 'package:easy_localization/easy_localization.dart';

/// Amount parsing/validation shared by the operation form fields.
class OperationFormValidators {
  const OperationFormValidators._();

  /// Optional EGP amount: empty is allowed, otherwise it must be a
  /// non-negative number.
  static String? amount(String? value) {
    final raw = value?.trim() ?? '';
    if (raw.isEmpty) return null;
    final amount = double.tryParse(raw.replaceAll(',', ''));
    if (amount == null) return 'operation_form.invalid_amount'.tr();
    if (amount < 0) return 'operation_form.negative_amount'.tr();
    return null;
  }

  /// Converts a displayed EGP value to integer piasters.
  static int toPiasters(String value) {
    final amount = double.tryParse(value.trim().replaceAll(',', ''));
    if (amount == null || amount < 0) return 0;
    return (amount * 100).round();
  }
}
