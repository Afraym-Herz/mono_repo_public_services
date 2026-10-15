import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/queue_dao.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart'
    as entity;
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_entry.dart'
    as entity;

/// Concrete Drift implementation of [IQueueDatasource].
class QueueDriftDatasource implements IQueueDatasource {
  final QueueDao dao;

  QueueDriftDatasource(this.dao);

  @override
  Future<List<entity.Appointment>> fetchAppointments(DateTime date) async {
    final rows = await dao.getAppointmentsForDate(date);
    return rows.map(_toDomainAppointment).toList();
  }

  @override
  Future<int> insertAppointment(entity.Appointment appointment) async {
    return dao.insertAppointment(_toAppointmentCompanion(appointment));
  }

  @override
  Future<void> updateAppointment(entity.Appointment appointment) async {
    await dao.updateAppointment(_toAppointmentCompanion(appointment));
  }

  @override
  Future<List<entity.QueueEntry>> fetchQueueByDate(DateTime date) async {
    final rows = await dao.getQueueForDate(date);
    return rows.map(_toDomainQueueEntry).toList();
  }

  @override
  Future<int> insertQueueEntry(entity.QueueEntry entry) async {
    final count = await dao.countQueueForDate(entry.scheduledAt);
    return dao.insertQueueEntry(
      QueueEntriesCompanion(
        patientId: Value(entry.patientId),
        queueDate: Value(entry.scheduledAt),
        queueNumber: Value(count + 1),
        position: Value(count + 1),
        status: Value(entry.status),
        arrivedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> updateQueueEntry(entity.QueueEntry entry) async {
    await dao.updateQueueEntry(
      QueueEntriesCompanion(
        id: Value(entry.id),
        patientId: Value(entry.patientId),
        queueDate: Value(entry.scheduledAt),
        status: Value(entry.status),
      ),
    );
  }

  @override
  Future<int> countQueueForDate(DateTime date) async {
    return dao.countQueueForDate(date);
  }

  entity.Appointment _toDomainAppointment(Appointment row) {
    return entity.Appointment(
      id: row.id,
      patientId: row.patientId,
      scheduledDate: row.scheduledDate,
      scheduledTime: row.scheduledTime,
      type: row.type,
      status: row.status,
      reason: row.reason,
      notes: row.notes,
      cancelledReason: row.cancelledReason,
      createdBy: int.tryParse(row.createdBy) ?? 0,
      createdAt: row.scheduledDate,
      updatedAt: row.scheduledDate,
    );
  }

  AppointmentsCompanion _toAppointmentCompanion(entity.Appointment appt) {
    return AppointmentsCompanion(
      id: appt.id > 0 ? Value(appt.id) : const Value.absent(),
      patientId: Value(appt.patientId),
      scheduledDate: Value(appt.scheduledDate),
      scheduledTime: Value(appt.scheduledTime),
      type: Value(appt.type),
      status: Value(appt.status),
      reason: Value(appt.reason),
      notes: Value(appt.notes),
      cancelledReason: Value(appt.cancelledReason),
      createdBy: Value(appt.createdBy.toString()),
    );
  }

  entity.QueueEntry _toDomainQueueEntry(QueueEntry row) {
    return entity.QueueEntry(
      id: row.id,
      patientId: row.patientId,
      scheduledAt: row.queueDate,
      status: row.status,
    );
  }
}
