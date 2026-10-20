part of 'queue_dao.dart';

extension QueueDaoRestore on QueueDao {
  Future<bool> restoreEntry(int entryId) => transaction(() async {
    final entry = await (select(
      queueEntries,
    )..where((q) => q.id.equals(entryId))).getSingleOrNull();
    if (entry == null) return false;
    if (entry.cancelReason == AppConstants.queueCancelReasonRescheduled) {
      return false;
    }
    final isCancelled = entry.status == AppConstants.queueStatusCancelled;
    final isNoShow = entry.status == AppConstants.queueStatusNoShow;
    final isUnpaidDone =
        entry.status == AppConstants.queueStatusDone && entry.paidAt == null;
    if (!isCancelled && !isNoShow && !isUnpaidDone) return false;
    final todayEntries = await getQueueForDate(entry.queueDate);
    final maxPos = todayEntries.fold<int>(0, (m, e) => math.max(m, e.position));
    await (update(queueEntries)..where((q) => q.id.equals(entryId))).write(
      QueueEntriesCompanion(
        status: const Value(AppConstants.queueStatusWaiting),
        position: Value(maxPos + 1),
        calledAt: const Value(null),
        finishedAt: const Value(null),
        paidAt: const Value(null),
        paidAmountPiasters: const Value(null),
        cancelReason: const Value(null),
      ),
    );
    if (entry.appointmentId != null) {
      await (update(
        appointments,
      )..where((a) => a.id.equals(entry.appointmentId!))).write(
        const AppointmentsCompanion(
          status: Value(AppConstants.appointmentStatusBooked),
          cancelledReason: Value(null),
        ),
      );
    }
    return true;
  });

  Future<bool> collectEntry(
    int entryId,
    int amountPiasters,
    DateTime paidAt,
  ) async {
    final rows =
        await (update(queueEntries)..where(
              (q) =>
                  q.id.equals(entryId) &
                  q.status.equals(AppConstants.queueStatusDone) &
                  q.paidAt.isNull(),
            ))
            .write(
              QueueEntriesCompanion(
                paidAt: Value(paidAt),
                paidAmountPiasters: Value(amountPiasters),
              ),
            );
    return rows > 0;
  }
}
