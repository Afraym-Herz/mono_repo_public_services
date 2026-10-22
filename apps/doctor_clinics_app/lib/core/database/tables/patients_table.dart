import 'package:drift/drift.dart';

class Patients extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fileNumber => text().unique()();
  TextColumn get fullName => text()();
  TextColumn get searchText => text()();
  TextColumn get gender => text()();
  DateTimeColumn get birthDate => dateTime().nullable()();
  IntColumn get age => integer().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get phone2 => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get occupation => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get bloodType => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class PatientAllergies extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get patientId => integer().references(Patients, #id)();
  TextColumn get name => text()();
  TextColumn get severity => text().nullable()();
  TextColumn get notes => text().nullable()();
}

class PatientConditions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get patientId => integer().references(Patients, #id)();
  TextColumn get name => text()();
  DateTimeColumn get sinceDate => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
}
