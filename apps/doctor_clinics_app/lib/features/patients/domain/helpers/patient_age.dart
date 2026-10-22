/// Age calculation shared by the register, the profile and the demo seeders.
class PatientAge {
  PatientAge._();

  /// Whole years between [birthDate] and [now].
  static int yearsSince(DateTime birthDate, {DateTime? now}) {
    final today = now ?? DateTime.now();
    var years = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      years--;
    }
    return years < 0 ? 0 : years;
  }

  /// Whole years for an ISO-8601 [value], or null when it is missing/invalid.
  static int? fromIsoDate(String? value, {DateTime? now}) {
    if (value == null) return null;
    final date = DateTime.tryParse(value);
    return date == null ? null : yearsSince(date, now: now);
  }
}
