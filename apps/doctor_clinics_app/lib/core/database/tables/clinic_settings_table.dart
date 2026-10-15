import 'package:drift/drift.dart';

import '../db_constants.dart';

class ClinicSettingsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get clinicName => text()();
  TextColumn get doctorName => text().nullable()();
  TextColumn get specialty => text().nullable()();
  TextColumn get qualifications => text().nullable()();
  TextColumn get phones => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get workingHours => text().nullable()();
  TextColumn get logoPath => text().nullable()();
  TextColumn get printLanguage => text().withDefault(
    const Constant(DbConstants.printLanguageDefault),
  )();
  TextColumn get paperSize => text().withDefault(
    const Constant(DbConstants.paperSizeDefault),
  )();
  IntColumn get defaultConsultationFee => integer().withDefault(
    const Constant(DbConstants.defaultConsultationFeeDefault),
  )();
  IntColumn get slotLengthMinutes => integer().withDefault(
    const Constant(DbConstants.slotLengthMinutesDefault),
  )();
}
