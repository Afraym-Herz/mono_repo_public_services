part of 'queue_dao.dart';

extension QueueDaoTransitions on QueueDao {
  /// Finishes a consultation and records the cash collected now in one
  /// transaction. The booking deposit is stored on the appointment and is not
  /// included in [amountPiasters].
  Future<bool> finishEntryWithPayment({
    required int entryId,
    required int amountPiasters,
    required DateTime finishedAt,
  }) => transaction(() async {
    final entry = await (select(
      queueEntries,
    )..where((q) => q.id.equals(entryId))).getSingleOrNull();
    if (entry == null) return false;
    if (entry.status != AppConstants.queueStatusInConsultation) return false;
    await (update(queueEntries)..where((q) => q.id.equals(entryId))).write(
      QueueEntriesCompanion(
        status: const Value(AppConstants.queueStatusDone),
        finishedAt: Value(finishedAt),
        paidAt: Value(finishedAt),
        paidAmountPiasters: Value(amountPiasters),
      ),
    );
    if (entry.appointmentId != null) {
      await (update(
        appointments,
      )..where((a) => a.id.equals(entry.appointmentId!))).write(
        const AppointmentsCompanion(
          status: Value(AppConstants.appointmentStatusDone),
        ),
      );
    }
    return true;
  });

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
