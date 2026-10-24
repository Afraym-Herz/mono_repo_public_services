/// Parses and formats money typed in pounds. Amounts are stored as piasters.
class MoneyInput {
  MoneyInput._();

  static const _arabicDigits = '٠١٢٣٤٥٦٧٨٩';
  static const _persianDigits = '۰۱۲۳۴۵۶۷۸۹';

  /// Empty text is treated as zero. Invalid or negative text returns null.
  static int? tryParsePiasters(String text) {
    final normalized = _normalize(text);
    if (normalized.isEmpty) return 0;
    final pounds = double.tryParse(normalized);
    if (pounds == null || !pounds.isFinite || pounds < 0) return null;
    return (pounds * 100).round();
  }

  static String _normalize(String input) {
    final buffer = StringBuffer();
    for (final char in input.trim().split('')) {
      final arabic = _arabicDigits.indexOf(char);
      if (arabic != -1) {
        buffer.write(arabic);
        continue;
      }
      final persian = _persianDigits.indexOf(char);
      if (persian != -1) {
        buffer.write(persian);
        continue;
      }
      if (char == '٫') {
        buffer.write('.');
      } else if (char != '٬' && char != ',') {
        buffer.write(char);
      }
    }
    return buffer.toString();
  }

  /// Plain pounds for prefilled/read-only fields, without the currency suffix.
  static String poundsText(int piasters) {
    final value = (piasters / 100).toStringAsFixed(2);
    return value.endsWith('.00') ? value.substring(0, value.length - 3) : value;
  }
}
