part of 'queue_dao.dart';

extension QueueDaoSchedule on QueueDao {
  Future<Appointment?> getAppointmentById(int id) =>
      (select(appointments)..where((a) => a.id.equals(id))).getSingleOrNull();

  /// Highest number ever used on [date] plus one. Cancelled rows are included
  /// because ticket numbers are permanent and never reused.
  Future<int> nextQueueNumberForDate(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = DateTime(start.year, start.month, start.day + 1);
    final variables = [
      Variable.withDateTime(start),
      Variable.withDateTime(end),
    ];
    final appointmentMax = await customSelect(
      'SELECT MAX(queue_number) AS m FROM appointments '
      'WHERE scheduled_date >= ? AND scheduled_date < ?',
      variables: variables,
    ).getSingle();
    final entryMax = await customSelect(
      'SELECT MAX(queue_number) AS m FROM queue_entries '
      'WHERE queue_date >= ? AND queue_date < ?',
      variables: variables,
    ).getSingle();
    return math.max(
          appointmentMax.read<int?>('m') ?? 0,
          entryMax.read<int?>('m') ?? 0,
        ) +
        1;
  }

  Future<int> nextPositionForDate(DateTime date) async {
    final entries = await getQueueForDate(date);
    return entries.fold<int>(0, (m, e) => math.max(m, e.position)) + 1;
  }

  /// The live queue entry for [appointmentId] on [day]. Rescheduled
  /// appointments keep a cancelled tombstone on the old day, so lookups must
  /// always be scoped to a day.
  Future<QueueEntry?> getQueueEntryForAppointment(
    int appointmentId,
    DateTime day,
  ) {
    final start = DateTime(day.year, day.month, day.day);
    final end = DateTime(start.year, start.month, start.day + 1);
    return (select(queueEntries)..where(
          (q) =>
              q.appointmentId.equals(appointmentId) &
              q.queueDate.isBiggerOrEqualValue(start) &
              q.queueDate.isSmallerThanValue(end),
        ))
        .getSingleOrNull();
  }
}
