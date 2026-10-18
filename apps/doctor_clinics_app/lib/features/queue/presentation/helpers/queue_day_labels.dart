import 'package:core/core.dart';

import 'queue_session.dart';

/// Localized date and clinic-session strings for the queue day banner.
///
/// Delegates to [DateConverter] so the `ar`/`en` formatting (and Arabic-Indic
/// digits) matches the rest of the app.
class QueueDayLabels {
  const QueueDayLabels._();

  /// e.g. `الخميس 15 أكتوبر 2025` / `Thursday 15 October 2025`.
  static String date(DateTime date, String localeTag) =>
      DateConverter.localizedFullDate(date, localeTag);

  /// e.g. `٩:٠٠ ص - ١٢:٠٠ م`. [day] anchors the session clock to a date.
  static String timeRange(
    QueueSession session,
    DateTime day,
    String localeTag,
  ) =>
      '${DateConverter.localizedTime(session.startAt(day), localeTag)} - '
      '${DateConverter.localizedTime(session.endAt(day), localeTag)}';
}
