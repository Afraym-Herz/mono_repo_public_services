import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_board.dart';

/// Contract for appointment booking and queue board management.
abstract class IQueueRepository {
  FutureResult<QueueBoard> getTodayBoard();

  FutureResult<List<Appointment>> getAppointmentsByDate(DateTime date);
  FutureResult<List<AppointmentListItem>> getAppointmentsInRange(
    DateTime start,
    DateTime end,
  );
  FutureResult<Appointment> bookAppointment(Appointment appointment);
  FutureResult<void> cancelAppointment(int id, String reason);
  FutureResult<void> rescheduleAppointment(int id, DateTime newDate);

  FutureResult<void> addWalkIn(
    int patientId, {
    String? notes,
    int depositPiasters = 0,
  });
  FutureResult<void> finishEntryWithPayment(int entryId, int amountPiasters);
  FutureResult<void> callEntry(int entryId);
  FutureResult<void> finishEntry(int entryId);
  FutureResult<void> cancelEntry(int entryId, {String? reason});
  FutureResult<void> markNoShow(int entryId);
  FutureResult<void> restoreEntry(int entryId);
  FutureResult<void> collectEntry(int entryId, int amountPiasters);
  FutureResult<void> advanceEntry(int entryId);
  FutureResult<void> setUrgent(int entryId, bool urgent);
  FutureResult<void> reorderWaiting(List<int> orderedEntryIds);

  FutureResult<int> nextQueueNumber(DateTime date);
}
