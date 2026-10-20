part of 'queue_dao.dart';

extension QueueDaoUrgent on QueueDao {
  Future<void> setUrgent(int entryId, bool urgent) => transaction(() async {
    final entry = await (select(
      queueEntries,
    )..where((q) => q.id.equals(entryId))).getSingleOrNull();
    if (entry == null || entry.status != AppConstants.queueStatusWaiting) {
      return;
    }
    if (!urgent) {
      await (update(queueEntries)..where((q) => q.id.equals(entryId))).write(
        const QueueEntriesCompanion(isUrgent: Value(false)),
      );
      return;
    }
    if (entry.isUrgent) return;
    final today = await getQueueForDate(entry.queueDate);
    final active = today.where(
      (e) => e.status == AppConstants.queueStatusInConsultation || e.isUrgent,
    );
    final maxActive = active.fold<int>(0, (m, e) => math.max(m, e.position));
    final target = maxActive + 1;
    final start = DateTime(
      entry.queueDate.year,
      entry.queueDate.month,
      entry.queueDate.day,
    );
    final end = DateTime(start.year, start.month, start.day + 1);
    await customUpdate(
      'UPDATE queue_entries SET position = position + 1 '
      'WHERE queue_date >= ? AND queue_date < ? AND position >= ? AND id != ?',
      variables: [
        Variable.withDateTime(start),
        Variable.withDateTime(end),
        Variable.withInt(target),
        Variable.withInt(entryId),
      ],
      updates: {queueEntries},
    );
    await (update(queueEntries)..where((q) => q.id.equals(entryId))).write(
      QueueEntriesCompanion(
        position: Value(target),
        isUrgent: const Value(true),
      ),
    );
  });
}
