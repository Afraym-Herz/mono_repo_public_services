import 'package:drift/drift.dart';
import 'patients_table.dart';

class Appointments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get patientId => integer().references(Patients, #id)();
  DateTimeColumn get scheduledDate => dateTime()();
  // Day-only bookings: kept for legacy rows, never read by the booking flow.
  TextColumn get scheduledTime => text()();
  // Per-day ticket number. Assigned when the booking is created.
  IntColumn get queueNumber => integer().nullable()();
  // See AppConstants.appointmentTypeBooked/WalkIn/FollowUp.
  TextColumn get type => text()();
  // See AppConstants.appointmentStatusBooked/InConsultation/Done/Cancelled/
  // NoShow. Legacy arrived/waiting rows are normalized by the v3 migration.
  TextColumn get status => text()();
  TextColumn get reason => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get cancelledReason => text().nullable()();
  // Integer piasters paid when the appointment was booked. Displayed to the
  // secretary; the amount collected after the visit is stored separately.
  IntColumn get depositPiasters => integer().withDefault(const Constant(0))();
  TextColumn get createdBy => text()();
}

class QueueEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get appointmentId =>
      integer().nullable().references(Appointments, #id)();
  IntColumn get patientId => integer().references(Patients, #id)();
  DateTimeColumn get queueDate => dateTime()();
  IntColumn get queueNumber => integer()();
  IntColumn get position => integer()();
  // See AppConstants.queueStatusWaiting/InConsultation/Done/Cancelled/NoShow.
  TextColumn get status => text()();
  DateTimeColumn get arrivedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get calledAt => dateTime().nullable()();
  DateTimeColumn get finishedAt => dateTime().nullable()();
  BoolColumn get isUrgent => boolean().withDefault(const Constant(false))();
  DateTimeColumn get paidAt => dateTime().nullable()();
  IntColumn get paidAmountPiasters => integer().nullable()();
  TextColumn get cancelReason => text().nullable()();
}
