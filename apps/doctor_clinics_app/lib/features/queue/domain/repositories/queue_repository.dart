import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_board.dart';

/// Contract for appointment booking and queue board management.
abstract class IQueueRepository {
  FutureResult<QueueBoard> getTodayBoard();

  FutureResult<List<Appointment>> getAppointmentsByDate(DateTime date);
  FutureResult<Appointment> bookAppointment(Appointment appointment);
  FutureResult<void> cancelAppointment(int id, String reason);
  FutureResult<void> rescheduleAppointment(
    int id,
    DateTime newDate,
    String newTime,
  );

  FutureResult<void> checkIn(int appointmentId);
  FutureResult<void> addWalkIn(int patientId);
  FutureResult<void> callEntry(int entryId);
  FutureResult<void> finishEntry(int entryId);
  FutureResult<void> cancelEntry(int entryId, {String? reason});
  FutureResult<void> restoreEntry(int entryId);
  FutureResult<void> collectEntry(int entryId, int amountPiasters);
  FutureResult<void> advanceEntry(int entryId);
  FutureResult<void> setUrgent(int entryId, bool urgent);
  FutureResult<void> reorderWaiting(List<int> orderedEntryIds);

  FutureResult<int> nextQueueNumber(DateTime date);
  FutureResult<bool> isSlotAvailable(DateTime date, String time);
}
