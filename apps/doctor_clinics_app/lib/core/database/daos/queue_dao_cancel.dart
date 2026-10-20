part of 'queue_dao.dart';

extension QueueDaoCancel on QueueDao {
  Future<void> cancelAppointment(int id, String reason) =>
      transaction(() async {
        final appointment = await getAppointmentById(id);
        if (appointment == null) return;
        await (update(appointments)..where((a) => a.id.equals(id))).write(
          AppointmentsCompanion(
            status: const Value(AppConstants.appointmentStatusCancelled),
            cancelledReason: Value(reason),
          ),
        );
        final entry = await getQueueEntryForAppointment(
          id,
          appointment.scheduledDate,
        );
        if (entry == null || entry.status == AppConstants.queueStatusDone) {
          return;
        }
        await (update(queueEntries)..where((q) => q.id.equals(entry.id))).write(
          QueueEntriesCompanion(
            status: const Value(AppConstants.queueStatusCancelled),
            cancelReason: Value(reason),
            finishedAt: Value(DateTime.now()),
          ),
        );
      });
}
