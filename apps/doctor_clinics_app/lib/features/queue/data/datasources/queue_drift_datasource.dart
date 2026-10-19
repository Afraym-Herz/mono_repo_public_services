import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/queue_dao.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_drift_mapper.dart';
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
    return rows.map(QueueDriftMapper.toDomainAppointment).toList();
  }

  @override
  Future<int> insertAppointment(entity.Appointment appointment) async {
    return dao.insertAppointment(
      QueueDriftMapper.toAppointmentCompanion(appointment),
    );
  }

  @override
  Future<void> updateAppointment(entity.Appointment appointment) async {
    await dao.updateAppointment(
      QueueDriftMapper.toAppointmentCompanion(appointment),
    );
  }

  @override
  Future<List<entity.QueueEntry>> fetchQueueByDate(DateTime date) async {
    final rows = await dao.getQueueForDate(date);
    return rows.map(QueueDriftMapper.toDomainQueueEntry).toList();
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
}
