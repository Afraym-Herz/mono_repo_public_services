import 'package:doctor_clinics_app/features/queue/domain/repositories/queue_repository.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_calendar.dart';

/// Badge counts for the appointments header.
///
/// They always describe *now* — today and the current calendar week — regardless
/// of the anchor the user is browsing, so the values stay stable while paging.
class AppointmentHeaderCounts {
  AppointmentHeaderCounts._();

  /// Returns `(todayCount, weekCount)`. Counts fall back to zero when the local
  /// query fails; the planner body reports the real error.
  static Future<(int, int)> load(IQueueRepository repository) async {
    final today = AppointmentCalendar.dayOf(DateTime.now());
    final weekStart = AppointmentCalendar.startOfWeek(today);
    final weekEnd = DateTime(
      weekStart.year,
      weekStart.month,
      weekStart.day + 7,
    );
    final result = await repository.getAppointmentsInRange(weekStart, weekEnd);
    return result.fold(
      (_) => (0, 0),
      (items) => (
        items
            .where(
              (item) =>
                  AppointmentCalendar.isSameDay(item.scheduledDate, today),
            )
            .length,
        items.length,
      ),
    );
  }
}
