import '../app_database.dart';

class QueueEntryRowData {
  final QueueEntry entry;
  final Patient patient;
  final Appointment? appointment;

  const QueueEntryRowData(this.entry, this.patient, this.appointment);
}

/// Appointment plus its patient, used by the Day/Week planner.
class AppointmentRowData {
  final Appointment appointment;
  final Patient patient;

  const AppointmentRowData(this.appointment, this.patient);
}
