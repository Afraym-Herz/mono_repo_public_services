import 'package:doctor_clinics_app/features/queue/domain/entities/queue_entry.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart';

/// Contract for appointment booking and queue management.
abstract class IQueueRepository {
  //   Appointments
  Future<List<Appointment>> getAppointmentsByDate(DateTime date);
  Future<Appointment> bookAppointment(Appointment appointment);
  Future<void> cancelAppointment(int id, String reason);
  Future<void> rescheduleAppointment(int id, DateTime newDate, String newTime);

  //   Queue
  Future<List<QueueEntry>> getTodayQueue();
  Future<QueueEntry> addToQueue(int appointmentId);
  Future<void> addWalkIn(int patientId);
  Future<void> updateQueueStatus(int id, String status);
  Future<void> reorderQueue(int id, int newPosition);
  Future<void> markUrgent(int id, bool isUrgent);

  //   Query helpers
  Future<int> nextQueueNumber(DateTime date);
  Future<bool> isSlotAvailable(DateTime date, String time);
}
