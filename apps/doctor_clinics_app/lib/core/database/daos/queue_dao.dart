import 'dart:math' as math;
import 'package:core/core.dart';
import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/appointments_table.dart';
import '../tables/patients_table.dart';
import 'queue_row_data.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_failure.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';

part 'queue_dao.g.dart';
part 'queue_dao_transitions.dart';
part 'queue_dao_reorder.dart';

@DriftAccessor(tables: [Appointments, QueueEntries, Patients])
class QueueDao extends DatabaseAccessor<AppDatabase> with _$QueueDaoMixin {
  QueueDao(super.db);

  Future<List<Appointment>> getAllAppointments() => select(appointments).get();
  Future<int> insertAppointment(AppointmentsCompanion entry) => into(appointments).insert(entry);
  Future<bool> updateAppointment(AppointmentsCompanion entry) => update(appointments).replace(entry);

  Future<List<QueueEntryRowData>> getBoardForDate(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    final query = select(queueEntries).join([
      innerJoin(patients, patients.id.equalsExp(queueEntries.patientId)),
      leftOuterJoin(appointments, appointments.id.equalsExp(queueEntries.appointmentId)),
    ])
      ..where(queueEntries.queueDate.isBiggerOrEqualValue(start) &
          queueEntries.queueDate.isSmallerThanValue(end))
      ..orderBy([OrderingTerm.asc(queueEntries.position)]);
    final rows = await query.get();
    return rows.map((r) => QueueEntryRowData(
      r.readTable(queueEntries),
      r.readTable(patients),
      r.readTableOrNull(appointments),
    )).toList();
  }

  Future<List<BookedAppointmentRowData>> getBookedForDate(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    final query = select(appointments).join([
      innerJoin(patients, patients.id.equalsExp(appointments.patientId)),
    ])
      ..where(appointments.scheduledDate.isBiggerOrEqualValue(start) &
          appointments.scheduledDate.isSmallerThanValue(end) &
          appointments.status.equals(AppConstants.appointmentStatusBooked))
      ..orderBy([OrderingTerm.asc(appointments.scheduledTime)]);
    final rows = await query.get();
    return rows.map((r) => BookedAppointmentRowData(
      r.readTable(appointments),
      r.readTable(patients),
    )).toList();
  }

  Future<List<QueueEntry>> getQueueForDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (select(queueEntries)
          ..where((q) =>
              q.queueDate.isBiggerOrEqualValue(start) &
              q.queueDate.isSmallerThanValue(end)))
        .get();
  }

  Future<List<Appointment>> getAppointmentsForDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (select(appointments)
          ..where((a) =>
              a.scheduledDate.isBiggerOrEqualValue(start) &
              a.scheduledDate.isSmallerThanValue(end)))
        .get();
  }

  Future<int> insertQueueEntry(QueueEntriesCompanion entry) => into(queueEntries).insert(entry);
  Future<bool> updateQueueEntry(QueueEntriesCompanion entry) => update(queueEntries).replace(entry);

  Future<int> countQueueForDate(DateTime date) async {
    final list = await getQueueForDate(date);
    return list.length;
  }
}
