/// Allocates the next human-readable patient file number.
///
/// Existing numbers are four-digit sequences (for example `1042`). Non-numeric
/// demo values are ignored, and the first real file starts at `1001`.
abstract final class PatientFileNumber {
  static String next(int? highest) {
    final base = highest == null || highest < 1000 ? 1000 : highest;
    return '${base + 1}';
  }
}
