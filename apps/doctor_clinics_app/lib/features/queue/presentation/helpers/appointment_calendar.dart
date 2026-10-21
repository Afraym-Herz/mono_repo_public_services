/// How the appointment planner groups the schedule.
enum AppointmentViewMode { day, week, month }

/// Saturday-first calendar math shared by the cubit and the planner views.
class AppointmentCalendar {
  AppointmentCalendar._();

  static DateTime dayOf(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  static bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  static bool isSameMonth(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month;

  static DateTime startOfWeek(DateTime date) {
    final day = dayOf(date);
    final offset = (day.weekday - DateTime.saturday) % 7;
    return DateTime(day.year, day.month, day.day - offset);
  }

  static DateTime startOfMonth(DateTime date) =>
      DateTime(date.year, date.month);

  /// First day of the month [offset] months away from [date].
  static DateTime monthAnchor(DateTime date, int offset) =>
      DateTime(date.year, date.month + offset);

  static List<DateTime> weekDays(DateTime anchor) {
    final start = startOfWeek(anchor);
    return [
      for (var i = 0; i < 7; i++)
        DateTime(start.year, start.month, start.day + i),
    ];
  }

  /// The fixed 6×7 grid shown by the month view.
  static List<DateTime> monthGridDays(DateTime anchor) {
    final start = startOfWeek(startOfMonth(anchor));
    return [
      for (var i = 0; i < 42; i++)
        DateTime(start.year, start.month, start.day + i),
    ];
  }

  static List<List<DateTime>> monthGridWeeks(DateTime anchor) {
    final days = monthGridDays(anchor);
    return [
      for (var week = 0; week < 6; week++) days.sublist(week * 7, week * 7 + 7),
    ];
  }

  /// Half-open query window covering everything [mode] renders, so month
  /// spill-over days keep their real counts.
  static (DateTime, DateTime) rangeFor(
    AppointmentViewMode mode,
    DateTime anchor,
  ) {
    final start = switch (mode) {
      AppointmentViewMode.day => dayOf(anchor),
      AppointmentViewMode.week => startOfWeek(anchor),
      AppointmentViewMode.month => startOfWeek(startOfMonth(anchor)),
    };
    final days = switch (mode) {
      AppointmentViewMode.day => 1,
      AppointmentViewMode.week => 7,
      AppointmentViewMode.month => 42,
    };
    return (start, DateTime(start.year, start.month, start.day + days));
  }
}
