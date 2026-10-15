import 'package:drift/drift.dart';
import 'patients_table.dart';
import 'consultations_table.dart';

class Medicines extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get alias => text().nullable()();
  TextColumn get form => text().nullable()();
  TextColumn get strength => text().nullable()();
  TextColumn get instructions => text().nullable()();
  TextColumn get searchText => text()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}

class MedicinePresets extends Table {
  IntColumn get id => integer().autoIncrement()();
  // See AppConstants.presetTypeDosage/Frequency/Duration/Instruction.
  TextColumn get type => text()();
  TextColumn get labelAr => text()();
  TextColumn get labelEn => text()();
  TextColumn get value => text()();
}

class Prescriptions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get consultationId => integer().nullable().references(Consultations, #id)();
  IntColumn get patientId => integer().references(Patients, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get notes => text().nullable()();
  TextColumn get createdBy => text()();
}

class PrescriptionItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get prescriptionId => integer().references(Prescriptions, #id)();
  IntColumn get medicineId => integer().references(Medicines, #id)();
  TextColumn get medicineName => text()();
  TextColumn get dosage => text()();
  TextColumn get frequency => text()();
  TextColumn get duration => text()();
  TextColumn get instructions => text().nullable()();
  TextColumn get notes => text().nullable()();
}

class PrescriptionTemplates extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get notes => text().nullable()();
  TextColumn get itemsJson => text()();
}
