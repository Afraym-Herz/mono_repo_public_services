import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_entry.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart';

/// Contract for appointment booking and queue management.
abstract class IQueueRepository {
  //   Appointments
  FutureResult<List<Appointment>> getAppointmentsByDate(DateTime date);
  FutureResult<Appointment> bookAppointment(Appointment appointment);
  FutureResult<void> cancelAppointment(int id, String reason);
  FutureResult<void> rescheduleAppointment(
    int id,
    DateTime newDate,
    String newTime,
  );

  //   Queue
  FutureResult<List<QueueEntry>> getTodayQueue();
  FutureResult<QueueEntry> addToQueue(int appointmentId);
  FutureResult<void> addWalkIn(int patientId);
  FutureResult<void> updateQueueStatus(int id, String status);
  FutureResult<void> reorderQueue(int id, int newPosition);
  FutureResult<void> markUrgent(int id, bool isUrgent);

  //   Query helpers
  FutureResult<int> nextQueueNumber(DateTime date);
  FutureResult<bool> isSlotAvailable(DateTime date, String time);
}
