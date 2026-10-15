import 'package:doctor_clinics_app/core/database/daos/queue_dao.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_entry.dart';

/// Drift-backed stub of [IQueueDatasource].
class QueueDriftDatasource implements IQueueDatasource {
  final QueueDao dao;
  QueueDriftDatasource(this.dao);

  @override
  Future<List<Appointment>> fetchAppointments(DateTime date) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> insertAppointment(Appointment appointment) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> updateAppointment(Appointment appointment) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<List<QueueEntry>> fetchQueueByDate(DateTime date) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> insertQueueEntry(QueueEntry entry) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> updateQueueEntry(QueueEntry entry) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> countQueueForDate(DateTime date) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }
}
