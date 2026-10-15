import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/appointments_table.dart';

part 'queue_dao.g.dart';

@DriftAccessor(tables: [Appointments, QueueEntries])
class QueueDao extends DatabaseAccessor<AppDatabase> with _$QueueDaoMixin {
  QueueDao(super.db);

  Future<List<Appointment>> getAllAppointments() => select(appointments).get();
  Future<int> insertAppointment(AppointmentsCompanion entry) => into(appointments).insert(entry);
  Future<bool> updateAppointment(AppointmentsCompanion entry) => update(appointments).replace(entry);

  /// Queue entries for the calendar day of [date] (day-range, not exact
  /// timestamp equality — `queueDate` carries a time component).
  Future<List<QueueEntry>> getQueueForDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (select(queueEntries)
          ..where(
            (q) =>
                q.queueDate.isBiggerOrEqualValue(start) &
                q.queueDate.isSmallerThanValue(end),
          ))
        .get();
  }
  Future<List<Appointment>> getAppointmentsForDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (select(appointments)
          ..where(
            (a) =>
                a.scheduledDate.isBiggerOrEqualValue(start) &
                a.scheduledDate.isSmallerThanValue(end),
          ))
        .get();
  }

  Future<int> insertQueueEntry(QueueEntriesCompanion entry) => into(queueEntries).insert(entry);
  Future<bool> updateQueueEntry(QueueEntriesCompanion entry) => update(queueEntries).replace(entry);

  Future<int> countQueueForDate(DateTime date) async {
    final list = await getQueueForDate(date);
    return list.length;
  }
}
