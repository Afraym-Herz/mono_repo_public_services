part of '../app_database.dart';

/// Normalizes legacy rows to day-only dates and assigns a permanent per-day
/// queue number. Existing entry numbers win; the rest continue from the day's
/// highest number. Numbers are never reused, so `max + 1` is used.
Future<void> backfillAppointmentQueueNumbers(AppDatabase db) async {
  // The check-in step is gone: legacy "arrived"/"waiting" appointments become
  // simple day bookings, and legacy "arrived" queue rows become waiting rows.
  await db.customUpdate(
    'UPDATE appointments SET status = ? WHERE status IN (?, ?)',
    variables: [
      Variable.withString('booked'),
      Variable.withString('arrived'),
      Variable.withString('waiting'),
    ],
  );
  await db.customUpdate(
    'UPDATE queue_entries SET status = ? WHERE status = ?',
    variables: [Variable.withString('waiting'), Variable.withString('arrived')],
  );

  final appointmentRows = await db
      .customSelect(
        'SELECT id, scheduled_date FROM appointments '
        'ORDER BY scheduled_date, scheduled_time, id',
      )
      .get();
  if (appointmentRows.isEmpty) return;

  final entryRows = await db
      .customSelect(
        'SELECT appointment_id, queue_number, queue_date FROM queue_entries',
      )
      .get();
  final entryNumbers = <String, int>{};
  final dayMax = <String, int>{};
  for (final row in entryRows) {
    final number = row.read<int?>('queue_number');
    final epoch = row.read<int?>('queue_date');
    if (number == null || epoch == null) continue;
    final day = _dayKey(DateTime.fromMillisecondsSinceEpoch(epoch * 1000));
    if (number > (dayMax[day] ?? 0)) dayMax[day] = number;
    final appointmentId = row.read<int?>('appointment_id');
    if (appointmentId != null) entryNumbers['$appointmentId|$day'] = number;
  }

  final byDay = <String, List<({int id, DateTime date})>>{};
  for (final row in appointmentRows) {
    final id = row.read<int>('id');
    final date = DateTime.fromMillisecondsSinceEpoch(
      row.read<int>('scheduled_date') * 1000,
    );
    byDay.putIfAbsent(_dayKey(date), () => []).add((id: id, date: date));
  }

  for (final day in byDay.entries) {
    var next = dayMax[day.key] ?? 0;
    for (final appointment in day.value) {
      final midnight = DateTime(
        appointment.date.year,
        appointment.date.month,
        appointment.date.day,
      );
      final existing = entryNumbers['${appointment.id}|${day.key}'];
      if (existing == null) next++;
      await db.customUpdate(
        'UPDATE appointments SET scheduled_date = ?, queue_number = ? '
        'WHERE id = ?',
        variables: [
          Variable.withDateTime(midnight),
          Variable.withInt(existing ?? next),
          Variable.withInt(appointment.id),
        ],
      );
    }
  }
}

String _dayKey(DateTime date) => '${date.year}-${date.month}-${date.day}';
