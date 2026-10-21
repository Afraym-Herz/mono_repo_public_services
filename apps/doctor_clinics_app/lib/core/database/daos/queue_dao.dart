import 'dart:math' as math;
import 'package:core/core.dart';
import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/appointments_table.dart';
import '../tables/patients_table.dart';
import 'queue_row_data.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart'
    as domain;
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_failure.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';

part 'queue_dao.g.dart';
part 'queue_dao_schedule.dart';
part 'queue_dao_appointment_range.dart';
part 'queue_dao_ensure.dart';
part 'queue_dao_booking.dart';
part 'queue_dao_cancel.dart';
part 'queue_dao_reschedule.dart';
part 'queue_dao_no_show.dart';
part 'queue_dao_transitions.dart';
part 'queue_dao_restore.dart';
part 'queue_dao_reorder.dart';
part 'queue_dao_urgent.dart';

@DriftAccessor(tables: [Appointments, QueueEntries, Patients])
class QueueDao extends DatabaseAccessor<AppDatabase> with _$QueueDaoMixin {
  QueueDao(super.db);

  Future<List<Appointment>> getAllAppointments() => select(appointments).get();
  Future<int> insertAppointment(AppointmentsCompanion entry) =>
      into(appointments).insert(entry);
  Future<bool> updateAppointment(AppointmentsCompanion entry) =>
      update(appointments).replace(entry);

  Future<List<QueueEntryRowData>> getBoardForDate(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = DateTime(start.year, start.month, start.day + 1);
    final query =
        select(queueEntries).join([
            innerJoin(patients, patients.id.equalsExp(queueEntries.patientId)),
            leftOuterJoin(
              appointments,
              appointments.id.equalsExp(queueEntries.appointmentId),
            ),
          ])
          ..where(
            queueEntries.queueDate.isBiggerOrEqualValue(start) &
                queueEntries.queueDate.isSmallerThanValue(end) &
                (queueEntries.appointmentId.isNull() |
                    (appointments.scheduledDate.isBiggerOrEqualValue(start) &
                        appointments.scheduledDate.isSmallerThanValue(end))),
          )
          ..orderBy([OrderingTerm.asc(queueEntries.position)]);
    final rows = await query.get();
    return rows
        .map(
          (r) => QueueEntryRowData(
            r.readTable(queueEntries),
            r.readTable(patients),
            r.readTableOrNull(appointments),
          ),
        )
        .toList();
  }

  Future<List<QueueEntry>> getQueueForDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = DateTime(start.year, start.month, start.day + 1);
    return (select(queueEntries)..where(
          (q) =>
              q.queueDate.isBiggerOrEqualValue(start) &
              q.queueDate.isSmallerThanValue(end),
        ))
        .get();
  }

  Future<List<Appointment>> getAppointmentsForDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = DateTime(start.year, start.month, start.day + 1);
    return (select(appointments)..where(
          (a) =>
              a.scheduledDate.isBiggerOrEqualValue(start) &
              a.scheduledDate.isSmallerThanValue(end),
        ))
        .get();
  }

  Future<int> insertQueueEntry(QueueEntriesCompanion entry) =>
      into(queueEntries).insert(entry);
  Future<bool> updateQueueEntry(QueueEntriesCompanion entry) =>
      update(queueEntries).replace(entry);

  /// Removes appointments written by an older demo seed, together with their
  /// queue entries. Real bookings are never matched because [createdBy] is only
  /// written by the demo seeders.
  Future<void> deleteDemoAppointments(Iterable<String> markers) async {
    final rows = await (select(
      appointments,
    )..where((a) => a.createdBy.isIn(markers))).get();
    if (rows.isEmpty) return;
    final ids = rows.map((row) => row.id).toList(growable: false);
    await (delete(queueEntries)..where((q) => q.appointmentId.isIn(ids))).go();
    await (delete(appointments)..where((a) => a.id.isIn(ids))).go();
  }

  Future<int> countQueueForDate(DateTime date) async =>
      (await getBoardForDate(date)).length;
}
