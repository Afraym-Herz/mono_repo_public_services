/// Morning / evening clinic session window shown in the queue day banner.
///
/// Session windows are fixed constants for now (the clinic settings model does
/// not carry operating hours yet); move them onto `ClinicSettings` once it does.
class QueueSession {
  const QueueSession({
    required this.labelKey,
    required this.startMinutes,
    required this.endMinutes,
  });

  /// `.tr()` key for the localized session label (`queue_header.session_*`).
  final String labelKey;

  /// Session start, in minutes from midnight.
  final int startMinutes;

  /// Session end, in minutes from midnight.
  final int endMinutes;

  /// 09:00 → 12:00 morning clinic.
  static const QueueSession morning = QueueSession(
    labelKey: 'queue_header.session_morning',
    startMinutes: 9 * 60,
    endMinutes: 12 * 60,
  );

  /// 17:00 → 21:00 evening clinic.
  static const QueueSession evening = QueueSession(
    labelKey: 'queue_header.session_evening',
    startMinutes: 17 * 60,
    endMinutes: 21 * 60,
  );

  /// Session covering [now]; noon onwards maps to the evening clinic.
  static QueueSession forTime(DateTime now) =>
      now.hour < 12 ? morning : evening;

  /// Session start anchored to [day] (used for locale-aware time formatting).
  DateTime startAt(DateTime day) => _at(day, startMinutes);

  /// Session end anchored to [day].
  DateTime endAt(DateTime day) => _at(day, endMinutes);

  static DateTime _at(DateTime day, int minutesFromMidnight) => DateTime(
    day.year,
    day.month,
    day.day,
    minutesFromMidnight ~/ 60,
    minutesFromMidnight % 60,
  );
}
