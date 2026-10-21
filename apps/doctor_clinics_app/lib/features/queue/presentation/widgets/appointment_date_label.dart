import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_calendar.dart';

/// Date label for the planner header: a full day, or a weekday week range.
class AppointmentDateLabel {
  AppointmentDateLabel._();

  static String of(AppointmentViewMode mode, DateTime anchor, String locale) {
    switch (mode) {
      case AppointmentViewMode.day:
        return DateConverter.localizedFullDate(anchor, locale);
      case AppointmentViewMode.month:
        return DateConverter.localizedMonthYear(anchor, locale);
      case AppointmentViewMode.week:
        final start = AppointmentCalendar.startOfWeek(anchor);
        final end = DateTime(start.year, start.month, start.day + 6);
        return '${DateConverter.localizedWeekdayDate(start, locale)}'
            ' - ${DateConverter.localizedFullDate(end, locale)}';
    }
  }
}
