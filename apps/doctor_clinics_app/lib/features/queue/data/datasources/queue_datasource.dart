import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_board.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';

/// Local data-source for appointments and queue (Drift).
abstract class IQueueDatasource {
  Future<QueueBoard> fetchTodayBoard();
  Future<void> addWalkIn(int patientId, {String? notes});
  Future<bool> transitionEntry({
    required int entryId,
    required Set<QueueStatus> from,
    required QueueStatus to,
    required String appointmentStatus,
    DateTime? calledAt,
    DateTime? finishedAt,
    String? cancelReason,
  });
  Future<bool> restoreEntry(int entryId);
  Future<bool> collectEntry(int entryId, int amountPiasters);
  Future<bool> advanceEntry(int entryId);
  Future<void> setUrgent(int entryId, bool urgent);
  Future<bool> reorderWaiting(List<int> orderedEntryIds);
  Future<bool> markNoShow(int entryId);
  Future<int> countQueueForDate(DateTime date);

  // Appointments
  Future<List<Appointment>> fetchAppointments(DateTime date);
  Future<List<AppointmentListItem>> fetchAppointmentsInRange(
    DateTime start,
    DateTime end,
  );
  Future<Appointment> bookAppointment(Appointment appointment);
  Future<void> cancelAppointment(int id, String reason);
  Future<void> rescheduleAppointment(int id, DateTime newDate);
  Future<int> nextQueueNumber(DateTime date);
}
