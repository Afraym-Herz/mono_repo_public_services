import 'package:drift/drift.dart';
import 'patients_table.dart';
import 'appointments_table.dart';

class Consultations extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get patientId => integer().references(Patients, #id)();
  IntColumn get queueEntryId => integer().nullable().references(QueueEntries, #id)();
  DateTimeColumn get visitDate => dateTime()();
  TextColumn get chiefComplaint => text().nullable()();
  TextColumn get historyOfPresentIllness => text().nullable()();
  TextColumn get examinationNotes => text().nullable()();
  TextColumn get diagnosis => text().nullable()();
  TextColumn get treatmentPlan => text().nullable()();
  DateTimeColumn get followUpDate => dateTime().nullable()();
  TextColumn get followUpNotes => text().nullable()();
  // See AppConstants.consultationStatusDraft/Finalized.
  TextColumn get status => text()();
  TextColumn get createdBy => text()();
  DateTimeColumn get finalizedAt => dateTime().nullable()();
}

class VitalSigns extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get consultationId => integer().references(Consultations, #id)();
  RealColumn get weightKg => real().nullable()();
  RealColumn get heightCm => real().nullable()();
  IntColumn get bpSystolic => integer().nullable()();
  IntColumn get bpDiastolic => integer().nullable()();
  IntColumn get pulse => integer().nullable()();
  RealColumn get temperatureC => real().nullable()();
  IntColumn get spo2 => integer().nullable()();
  IntColumn get bloodSugar => integer().nullable()();
  TextColumn get notes => text().nullable()();
}
