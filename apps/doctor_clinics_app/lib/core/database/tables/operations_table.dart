import 'package:drift/drift.dart';
import 'patients_table.dart';

class Operations extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get patientId => integer().references(Patients, #id)();
  TextColumn get operationType => text()();
  DateTimeColumn get scheduledDate => dateTime()();
  TextColumn get scheduledTime => text().nullable()();
  TextColumn get surgeonName => text().nullable()();
  TextColumn get notes => text().nullable()();
  // See AppConstants.operationStatusScheduled/Completed/Cancelled.
  TextColumn get status => text()();
  IntColumn get cost => integer()(); // integer piasters
  IntColumn get depositAmount => integer()(); // integer piasters
}

class OperationRequiredTests extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get operationId => integer().references(Operations, #id)();
  TextColumn get testName => text()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();
}
