part of 'queue_dao.dart';

extension QueueDaoTransitions on QueueDao {
  Future<void> checkInAppointment(int appointmentId) => transaction(() async {
    final appt = await (select(appointments)
          ..where((a) => a.id.equals(appointmentId)))
        .getSingleOrNull();
    if (appt == null || appt.status != AppConstants.appointmentStatusBooked) {
      return;
    }
    final now = DateTime.now();
    final count = await countQueueForDate(now);
    final nextNumber = count + 1;
    await into(queueEntries).insert(
      QueueEntriesCompanion.insert(
        appointmentId: Value(appointmentId),
        patientId: appt.patientId,
        queueDate: now,
        queueNumber: nextNumber,
        position: nextNumber,
        status: AppConstants.queueStatusWaiting,
        arrivedAt: Value(now),
        isUrgent: const Value(false),
      ),
    );
    await (update(appointments)..where((a) => a.id.equals(appointmentId))).write(
      const AppointmentsCompanion(
        status: Value(AppConstants.appointmentStatusArrived),
      ),
    );
  });

  Future<void> addWalkInEntry(int patientId) => transaction(() async {
    final now = DateTime.now();
    final count = await countQueueForDate(now);
    final nextNumber = count + 1;
    await into(queueEntries).insert(
      QueueEntriesCompanion.insert(
        patientId: patientId,
        queueDate: now,
        queueNumber: nextNumber,
        position: nextNumber,
        status: AppConstants.queueStatusWaiting,
        arrivedAt: Value(now),
        isUrgent: const Value(false),
      ),
    );
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
    final entry = await (select(queueEntries)
          ..where((q) => q.id.equals(entryId)))
        .getSingleOrNull();
    if (entry == null) return false;
    final currentStatus = QueueStatus.tryParse(entry.status);
    if (currentStatus == null || !from.contains(currentStatus)) return false;
    if (to == QueueStatus.inConsultation) {
      final active = await (select(queueEntries)
            ..where((q) => q.status.equals(AppConstants.queueStatusInConsultation)))
          .get();
      if (active.isNotEmpty) {
        throw const QueueFailure('queue_row.error.current_in_progress');
      }
    }
    await (update(queueEntries)..where((q) => q.id.equals(entryId))).write(
      QueueEntriesCompanion(
        status: Value(to.code),
        calledAt: calledAt != null ? Value(calledAt) : const Value.absent(),
        finishedAt: finishedAt != null ? Value(finishedAt) : const Value.absent(),
        cancelReason: cancelReason != null ? Value(cancelReason) : const Value.absent(),
      ),
    );
    if (entry.appointmentId != null) {
      await (update(appointments)..where((a) => a.id.equals(entry.appointmentId!))).write(
        AppointmentsCompanion(
          status: Value(appointmentStatus),
          cancelledReason: cancelReason != null ? Value(cancelReason) : const Value.absent(),
        ),
      );
    }
    return true;
  });

  Future<bool> restoreEntry(int entryId) => transaction(() async {
    final entry = await (select(queueEntries)
          ..where((q) => q.id.equals(entryId)))
        .getSingleOrNull();
    if (entry == null) return false;
    final isCancelled = entry.status == AppConstants.queueStatusCancelled;
    final isUnpaidDone = entry.status == AppConstants.queueStatusDone && entry.paidAt == null;
    if (!isCancelled && !isUnpaidDone) return false;
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
      await (update(appointments)..where((a) => a.id.equals(entry.appointmentId!))).write(
        const AppointmentsCompanion(
          status: Value(AppConstants.appointmentStatusArrived),
          cancelledReason: Value(null),
        ),
      );
    }
    return true;
  });

  Future<bool> collectEntry(int entryId, int amountPiasters, DateTime paidAt) async {
    final rows = await (update(queueEntries)
          ..where((q) =>
              q.id.equals(entryId) &
              q.status.equals(AppConstants.queueStatusDone) &
              q.paidAt.isNull()))
        .write(
      QueueEntriesCompanion(
        paidAt: Value(paidAt),
        paidAmountPiasters: Value(amountPiasters),
      ),
    );
    return rows > 0;
  }
}
