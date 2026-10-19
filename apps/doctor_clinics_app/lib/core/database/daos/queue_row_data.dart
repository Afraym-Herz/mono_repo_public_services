import '../app_database.dart';

class QueueEntryRowData {
  final QueueEntry entry;
  final Patient patient;
  final Appointment? appointment;

  const QueueEntryRowData(this.entry, this.patient, this.appointment);
}

class BookedAppointmentRowData {
  final Appointment appointment;
  final Patient patient;

  const BookedAppointmentRowData(this.appointment, this.patient);
}
