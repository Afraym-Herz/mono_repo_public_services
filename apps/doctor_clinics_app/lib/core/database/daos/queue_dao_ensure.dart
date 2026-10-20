part of 'queue_dao.dart';

extension QueueDaoEnsure on QueueDao {
  /// Legacy rows (or rows written outside the booking flow) get their live
  /// queue entry lazily, which replaces the old check-in step.
  Future<void> ensureQueueEntriesForDate(DateTime date) =>
      transaction(() async {
        final day = DateTime(date.year, date.month, date.day);
        final dayAppointments = await getAppointmentsForDate(day);
        if (dayAppointments.isEmpty) return;
        final entries = await getQueueForDate(day);
        final withEntry = entries
            .map((e) => e.appointmentId)
            .whereType<int>()
            .toSet();
        var number = await nextQueueNumberForDate(day);
        var position = await nextPositionForDate(day);
        for (final appointment in dayAppointments) {
          if (withEntry.contains(appointment.id)) continue;
          if (appointment.status != AppConstants.appointmentStatusBooked) {
            continue;
          }
          final assigned = appointment.queueNumber ?? number;
          if (appointment.queueNumber == null) number++;
          await into(queueEntries).insert(
            QueueEntriesCompanion.insert(
              appointmentId: Value(appointment.id),
              patientId: appointment.patientId,
              queueDate: day,
              queueNumber: assigned,
              position: position++,
              status: AppConstants.queueStatusWaiting,
              arrivedAt: Value(DateTime.now()),
              isUrgent: const Value(false),
            ),
          );
          if (appointment.queueNumber == null) {
            await (update(appointments)
                  ..where((a) => a.id.equals(appointment.id)))
                .write(AppointmentsCompanion(queueNumber: Value(assigned)));
          }
        }
      });
}
