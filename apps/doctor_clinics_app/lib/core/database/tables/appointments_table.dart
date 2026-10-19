import 'package:drift/drift.dart';
import 'patients_table.dart';

class Appointments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get patientId => integer().references(Patients, #id)();
  DateTimeColumn get scheduledDate => dateTime()();
  TextColumn get scheduledTime => text()();
  // See AppConstants.appointmentTypeBooked/WalkIn/FollowUp.
  TextColumn get type => text()();
  // See AppConstants.appointmentStatusBooked/Arrived/Waiting/InConsultation/
  // Done/Cancelled/NoShow.
  TextColumn get status => text()();
  TextColumn get reason => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get cancelledReason => text().nullable()();
  TextColumn get createdBy => text()();
}

class QueueEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get appointmentId => integer().nullable().references(Appointments, #id)();
  IntColumn get patientId => integer().references(Patients, #id)();
  DateTimeColumn get queueDate => dateTime()();
  IntColumn get queueNumber => integer()();
  IntColumn get position => integer()();
  // See AppConstants.queueStatusWaiting/InConsultation/Done/Cancelled.
  TextColumn get status => text()();
  DateTimeColumn get arrivedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get calledAt => dateTime().nullable()();
  DateTimeColumn get finishedAt => dateTime().nullable()();
  BoolColumn get isUrgent => boolean().withDefault(const Constant(false))();
  DateTimeColumn get paidAt => dateTime().nullable()();
  IntColumn get paidAmountPiasters => integer().nullable()();
  TextColumn get cancelReason => text().nullable()();
}
