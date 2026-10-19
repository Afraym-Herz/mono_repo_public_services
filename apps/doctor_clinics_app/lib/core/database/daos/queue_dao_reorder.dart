part of 'queue_dao.dart';

extension QueueDaoReorder on QueueDao {
  Future<bool> advanceEntry(int entryId) => transaction(() async {
    final entry = await (select(queueEntries)
          ..where((q) => q.id.equals(entryId)))
        .getSingleOrNull();
    if (entry == null || entry.status != AppConstants.queueStatusWaiting) {
      return false;
    }
    final start = DateTime(entry.queueDate.year, entry.queueDate.month, entry.queueDate.day);
    final end = start.add(const Duration(days: 1));
    final sameGroup = await (select(queueEntries)
          ..where((q) =>
              q.queueDate.isBiggerOrEqualValue(start) &
              q.queueDate.isSmallerThanValue(end) &
              q.status.equals(AppConstants.queueStatusWaiting) &
              q.isUrgent.equals(entry.isUrgent))
          ..orderBy([(q) => OrderingTerm.asc(q.position)]))
        .get();
    final idx = sameGroup.indexWhere((e) => e.id == entryId);
    if (idx <= 0) return false;
    final prev = sameGroup[idx - 1];
    await (update(queueEntries)..where((q) => q.id.equals(entry.id))).write(
      QueueEntriesCompanion(position: Value(prev.position)),
    );
    await (update(queueEntries)..where((q) => q.id.equals(prev.id))).write(
      QueueEntriesCompanion(position: Value(entry.position)),
    );
    return true;
  });

  Future<void> setUrgent(int entryId, bool urgent) => transaction(() async {
    final entry = await (select(queueEntries)
          ..where((q) => q.id.equals(entryId)))
        .getSingleOrNull();
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
    await customUpdate(
      'UPDATE queue_entries SET position = position + 1 WHERE position >= ? AND id != ?',
      variables: [Variable.withInt(target), Variable.withInt(entryId)],
      updates: {queueEntries},
    );
    await (update(queueEntries)..where((q) => q.id.equals(entryId))).write(
      QueueEntriesCompanion(position: Value(target), isUrgent: const Value(true)),
    );
  });

  Future<bool> reorderWaiting(List<int> orderedEntryIds) => transaction(() async {
    if (orderedEntryIds.length < 2) return true;
    final now = DateTime.now();
    final today = await getQueueForDate(now);
    final waiting = today.where(
      (e) => e.status == AppConstants.queueStatusWaiting && !e.isUrgent,
    ).toList();
    final loadedIds = waiting.map((e) => e.id).toSet();
    if (loadedIds.length != orderedEntryIds.length ||
        !loadedIds.containsAll(orderedEntryIds)) {
      return false;
    }
    final activeOrUrgent = today.where(
      (e) => e.status == AppConstants.queueStatusInConsultation || e.isUrgent,
    );
    final base = activeOrUrgent.fold<int>(0, (m, e) => math.max(m, e.position));
    for (var i = 0; i < orderedEntryIds.length; i++) {
      await (update(queueEntries)..where((q) => q.id.equals(orderedEntryIds[i]))).write(
        QueueEntriesCompanion(position: Value(base + i + 1)),
      );
    }
    return true;
  });
}
