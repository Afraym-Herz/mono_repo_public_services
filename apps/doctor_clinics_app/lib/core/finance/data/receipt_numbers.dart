/// Builds the next sequential receipt number for [prefix].
///
/// Only numbers that follow `PREFIX-000001` are considered, so demo receipts
/// and legacy timestamp numbers do not disturb the running sequence.
String nextReceiptNumber(String prefix, Iterable<String> existing) {
  final pattern = RegExp('^$prefix-(\\d+)\$');
  var highest = 0;
  for (final value in existing) {
    final match = pattern.firstMatch(value.trim());
    final number = int.tryParse(match?.group(1) ?? '');
    if (number != null && number > highest) highest = number;
  }
  return '$prefix-${(highest + 1).toString().padLeft(6, '0')}';
}
