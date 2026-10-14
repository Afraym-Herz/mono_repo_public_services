import 'package:doctor_clinics_app/features/queue/domain/entities/queue_entry.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart';

/// Local data-source for appointments and queue (Drift).
abstract class IQueueDatasource {
  //   Appointments
  Future<List<Appointment>> fetchAppointments(DateTime date);
  Future<int> insertAppointment(Appointment appointment);
  Future<void> updateAppointment(Appointment appointment);

  //   Queue
  Future<List<QueueEntry>> fetchQueueByDate(DateTime date);
  Future<int> insertQueueEntry(QueueEntry entry);
  Future<void> updateQueueEntry(QueueEntry entry);
  Future<int> countQueueForDate(DateTime date);
}
