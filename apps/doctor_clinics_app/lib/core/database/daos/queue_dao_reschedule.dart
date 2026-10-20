part of 'queue_dao.dart';

extension QueueDaoReschedule on QueueDao {
  Future<void> rescheduleAppointment(int id, DateTime newDate) =>
      transaction(() async {
        final appointment = await getAppointmentById(id);
        if (appointment == null) return;
        final day = DateTime(newDate.year, newDate.month, newDate.day);
        final today = DateTime.now();
        if (day.isBefore(DateTime(today.year, today.month, today.day))) {
          throw const QueueFailure('appointment_error.past_date');
        }
        final oldDay = DateTime(
          appointment.scheduledDate.year,
          appointment.scheduledDate.month,
          appointment.scheduledDate.day,
        );
        final entry = await getQueueEntryForAppointment(id, oldDay);
        if (oldDay == day) {
          await (update(appointments)..where((a) => a.id.equals(id))).write(
            AppointmentsCompanion(
              scheduledDate: Value(day),
              scheduledTime: const Value(''),
              status: const Value(AppConstants.appointmentStatusBooked),
              cancelledReason: const Value(null),
            ),
          );
          return;
        }
        final number = await nextQueueNumberForDate(day);
        final position = await nextPositionForDate(day);
        await (update(appointments)..where((a) => a.id.equals(id))).write(
          AppointmentsCompanion(
            scheduledDate: Value(day),
            scheduledTime: const Value(''),
            queueNumber: Value(number),
            status: const Value(AppConstants.appointmentStatusBooked),
            cancelledReason: const Value(null),
          ),
        );
        await _retireEntry(entry);
        await into(queueEntries).insert(
          QueueEntriesCompanion.insert(
            appointmentId: Value(id),
            patientId: appointment.patientId,
            queueDate: day,
            queueNumber: number,
            position: position,
            status: AppConstants.queueStatusWaiting,
            arrivedAt: Value(DateTime.now()),
            isUrgent: Value(entry?.isUrgent ?? false),
          ),
        );
      });

  /// Keeps the old day's number reserved while freeing the patient from that
  /// day's live queue. Tombstones are excluded from the board.
  Future<void> _retireEntry(QueueEntry? entry) async {
    if (entry == null) return;
    await (update(queueEntries)..where((q) => q.id.equals(entry.id))).write(
      QueueEntriesCompanion(
        status: const Value(AppConstants.queueStatusCancelled),
        cancelReason: const Value(AppConstants.queueCancelReasonRescheduled),
        finishedAt: Value(DateTime.now()),
      ),
    );
  }
}
