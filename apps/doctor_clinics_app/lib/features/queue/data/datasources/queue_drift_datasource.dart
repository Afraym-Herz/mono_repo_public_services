import 'package:doctor_clinics_app/core/database/daos/queue_dao.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_drift_mapper.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart'
    as entity;
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_board.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';

class QueueDriftDatasource implements IQueueDatasource {
  final QueueDao dao;

  QueueDriftDatasource(this.dao);

  @override
  Future<QueueBoard> fetchTodayBoard() async {
    final now = DateTime.now();
    final boardRows = await dao.getBoardForDate(now);
    final bookedRows = await dao.getBookedForDate(now);
    final tickets = boardRows.map(QueueDriftMapper.toQueueTicket).toList();
    final ticketApptIds =
        tickets.map((t) => t.appointmentId).whereType<int>().toSet();
    final booked = bookedRows
        .where((b) => !ticketApptIds.contains(b.appointment.id))
        .map(QueueDriftMapper.toBooked)
        .toList();
    return QueueBoard(tickets: tickets, booked: booked);
  }

  @override
  Future<void> checkInAppointment(int appointmentId) =>
      dao.checkInAppointment(appointmentId);

  @override
  Future<void> addWalkIn(int patientId) => dao.addWalkInEntry(patientId);

  @override
  Future<bool> transitionEntry({
    required int entryId,
    required Set<QueueStatus> from,
    required QueueStatus to,
    required String appointmentStatus,
    DateTime? calledAt,
    DateTime? finishedAt,
    String? cancelReason,
  }) =>
      dao.transitionEntry(
        entryId: entryId,
        from: from,
        to: to,
        appointmentStatus: appointmentStatus,
        calledAt: calledAt,
        finishedAt: finishedAt,
        cancelReason: cancelReason,
      );

  @override
  Future<bool> restoreEntry(int entryId) => dao.restoreEntry(entryId);

  @override
  Future<bool> collectEntry(int entryId, int amountPiasters) =>
      dao.collectEntry(entryId, amountPiasters, DateTime.now());

  @override
  Future<bool> advanceEntry(int entryId) => dao.advanceEntry(entryId);

  @override
  Future<void> setUrgent(int entryId, bool urgent) =>
      dao.setUrgent(entryId, urgent);

  @override
  Future<bool> reorderWaiting(List<int> orderedEntryIds) =>
      dao.reorderWaiting(orderedEntryIds);

  @override
  Future<List<entity.Appointment>> fetchAppointments(DateTime date) async {
    final rows = await dao.getAppointmentsForDate(date);
    return rows.map(QueueDriftMapper.toDomainAppointment).toList();
  }

  @override
  Future<int> insertAppointment(entity.Appointment appointment) =>
      dao.insertAppointment(
        QueueDriftMapper.toAppointmentCompanion(appointment),
      );

  @override
  Future<void> updateAppointment(entity.Appointment appointment) =>
      dao.updateAppointment(
        QueueDriftMapper.toAppointmentCompanion(appointment),
      );

  @override
  Future<int> countQueueForDate(DateTime date) => dao.countQueueForDate(date);
}
