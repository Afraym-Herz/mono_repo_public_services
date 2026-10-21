import 'package:doctor_clinics_app/core/database/daos/queue_dao.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_appointment_datasource.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_drift_mapper.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_board.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';

class QueueDriftDatasource
    with QueueAppointmentDatasource
    implements IQueueDatasource {
  @override
  final QueueDao dao;

  QueueDriftDatasource(this.dao);

  @override
  Future<QueueBoard> fetchTodayBoard() async {
    final now = DateTime.now();
    await dao.ensureQueueEntriesForDate(now);
    final boardRows = await dao.getBoardForDate(now);
    return QueueBoard(
      tickets: boardRows.map(QueueDriftMapper.toQueueTicket).toList(),
    );
  }

  @override
  Future<void> addWalkIn(int patientId, {String? notes}) async {
    await dao.addWalkInAppointment(patientId, notes: notes);
  }

  @override
  Future<bool> transitionEntry({
    required int entryId,
    required Set<QueueStatus> from,
    required QueueStatus to,
    required String appointmentStatus,
    DateTime? calledAt,
    DateTime? finishedAt,
    String? cancelReason,
  }) => dao.transitionEntry(
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
  Future<bool> markNoShow(int entryId) => dao.markNoShow(entryId);

  @override
  Future<int> countQueueForDate(DateTime date) => dao.countQueueForDate(date);
}
