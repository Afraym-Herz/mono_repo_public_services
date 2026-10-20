part of 'queue_dao.dart';

extension QueueDaoNoShow on QueueDao {
  Future<bool> hasPaymentForDay(int patientId, DateTime day) async {
    final start = DateTime(day.year, day.month, day.day);
    final end = DateTime(start.year, start.month, start.day + 1);
    final payments = await customSelect(
      'SELECT COUNT(*) AS c FROM payments '
      'WHERE patient_id = ? AND created_at >= ? AND created_at < ?',
      variables: [
        Variable.withInt(patientId),
        Variable.withDateTime(start),
        Variable.withDateTime(end),
      ],
    ).getSingle();
    if ((payments.read<int?>('c') ?? 0) > 0) return true;
    final paidEntries =
        await (select(queueEntries)..where(
              (q) =>
                  q.patientId.equals(patientId) &
                  q.queueDate.isBiggerOrEqualValue(start) &
                  q.queueDate.isSmallerThanValue(end) &
                  q.paidAt.isNotNull(),
            ))
            .get();
    return paidEntries.isNotEmpty;
  }

  Future<bool> markNoShow(int entryId) => transaction(() async {
    final entry = await (select(
      queueEntries,
    )..where((q) => q.id.equals(entryId))).getSingleOrNull();
    if (entry == null) return false;
    if (entry.status != AppConstants.queueStatusWaiting &&
        entry.status != AppConstants.queueStatusInConsultation) {
      return false;
    }
    if (await hasPaymentForDay(entry.patientId, entry.queueDate)) {
      throw const QueueFailure('queue_row.error.no_show_paid');
    }
    await (update(queueEntries)..where((q) => q.id.equals(entryId))).write(
      QueueEntriesCompanion(
        status: const Value(AppConstants.queueStatusNoShow),
        finishedAt: Value(DateTime.now()),
      ),
    );
    if (entry.appointmentId != null) {
      await (update(
        appointments,
      )..where((a) => a.id.equals(entry.appointmentId!))).write(
        const AppointmentsCompanion(
          status: Value(AppConstants.appointmentStatusNoShow),
        ),
      );
    }
    return true;
  });
}
