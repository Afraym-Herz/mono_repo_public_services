part of 'queue_dao.dart';

extension QueueDaoBooking on QueueDao {
  Future<domain.Appointment> bookAppointment(domain.Appointment appointment) =>
      transaction(() async {
        final day = DateTime(
          appointment.scheduledDate.year,
          appointment.scheduledDate.month,
          appointment.scheduledDate.day,
        );
        final today = DateTime.now();
        if (day.isBefore(DateTime(today.year, today.month, today.day))) {
          throw const QueueFailure('appointment_error.past_date');
        }
        final number = await nextQueueNumberForDate(day);
        final now = DateTime.now();
        final id = await into(appointments).insert(
          AppointmentsCompanion.insert(
            patientId: appointment.patientId,
            scheduledDate: day,
            scheduledTime: '',
            queueNumber: Value(number),
            type: appointment.type,
            status: AppConstants.appointmentStatusBooked,
            reason: Value(appointment.reason),
            notes: Value(appointment.notes),
            createdBy: appointment.createdBy.toString(),
          ),
        );
        await into(queueEntries).insert(
          QueueEntriesCompanion.insert(
            appointmentId: Value(id),
            patientId: appointment.patientId,
            queueDate: day,
            queueNumber: number,
            position: await nextPositionForDate(day),
            status: AppConstants.queueStatusWaiting,
            arrivedAt: Value(now),
            isUrgent: const Value(false),
          ),
        );
        return appointment.copyWith(
          id: id,
          scheduledDate: day,
          scheduledTime: '',
          queueNumber: number,
          status: AppConstants.appointmentStatusBooked,
          createdAt: now,
          updatedAt: now,
        );
      });

  Future<domain.Appointment> addWalkInAppointment(
    int patientId, {
    String? notes,
  }) async {
    final today = DateTime.now();
    return bookAppointment(
      domain.Appointment(
        id: 0,
        patientId: patientId,
        scheduledDate: today,
        scheduledTime: '',
        type: AppConstants.appointmentTypeWalkIn,
        status: AppConstants.appointmentStatusBooked,
        notes: notes,
        createdBy: 0,
        createdAt: today,
        updatedAt: today,
      ),
    );
  }
}
