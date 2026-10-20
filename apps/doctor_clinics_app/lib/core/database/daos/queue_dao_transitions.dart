part of 'queue_dao.dart';

extension QueueDaoTransitions on QueueDao {
  Future<bool> transitionEntry({
    required int entryId,
    required Set<QueueStatus> from,
    required QueueStatus to,
    required String appointmentStatus,
    DateTime? calledAt,
    DateTime? finishedAt,
    String? cancelReason,
  }) => transaction(() async {
    final entry = await (select(
      queueEntries,
    )..where((q) => q.id.equals(entryId))).getSingleOrNull();
    if (entry == null) return false;
    final currentStatus = QueueStatus.tryParse(entry.status);
    if (currentStatus == null || !from.contains(currentStatus)) return false;
    if (to == QueueStatus.inConsultation) {
      final active =
          await (select(queueEntries)..where(
                (q) => q.status.equals(AppConstants.queueStatusInConsultation),
              ))
              .get();
      if (active.isNotEmpty) {
        throw const QueueFailure('queue_row.error.current_in_progress');
      }
    }
    await (update(queueEntries)..where((q) => q.id.equals(entryId))).write(
      QueueEntriesCompanion(
        status: Value(to.code),
        calledAt: calledAt != null ? Value(calledAt) : const Value.absent(),
        finishedAt: finishedAt != null
            ? Value(finishedAt)
            : const Value.absent(),
        cancelReason: cancelReason != null
            ? Value(cancelReason)
            : const Value.absent(),
      ),
    );
    if (entry.appointmentId != null) {
      await (update(
        appointments,
      )..where((a) => a.id.equals(entry.appointmentId!))).write(
        AppointmentsCompanion(
          status: Value(appointmentStatus),
          cancelledReason: cancelReason != null
              ? Value(cancelReason)
              : const Value.absent(),
        ),
      );
    }
    return true;
  });
}
