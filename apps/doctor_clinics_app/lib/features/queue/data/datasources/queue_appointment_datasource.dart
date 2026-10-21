import 'package:doctor_clinics_app/core/database/daos/queue_dao.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_drift_mapper.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart'
    as entity;
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';

/// Appointment-side reads/writes of the Drift queue datasource.
mixin QueueAppointmentDatasource {
  QueueDao get dao;

  Future<List<entity.Appointment>> fetchAppointments(DateTime date) async {
    final rows = await dao.getAppointmentsForDate(date);
    return rows.map(QueueDriftMapper.toDomainAppointment).toList();
  }

  Future<List<AppointmentListItem>> fetchAppointmentsInRange(
    DateTime start,
    DateTime end,
  ) async {
    final rows = await dao.getAppointmentRowsInRange(start, end);
    return rows.map(QueueDriftMapper.toAppointmentListItem).toList();
  }

  Future<entity.Appointment> bookAppointment(entity.Appointment appointment) =>
      dao.bookAppointment(appointment);

  Future<void> cancelAppointment(int id, String reason) =>
      dao.cancelAppointment(id, reason);

  Future<void> rescheduleAppointment(int id, DateTime newDate) =>
      dao.rescheduleAppointment(id, newDate);

  Future<int> nextQueueNumber(DateTime date) =>
      dao.nextQueueNumberForDate(date);
}
