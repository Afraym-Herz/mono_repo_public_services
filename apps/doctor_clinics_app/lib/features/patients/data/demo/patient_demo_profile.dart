import 'package:drift/drift.dart';
import 'package:core/core.dart';

import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/demo/queue_demo_patient.dart';

/// Maps a demo fixture row to the register's patient row.
class PatientDemoProfile {
  const PatientDemoProfile._();

  /// True when an older demo record lacks the profile block, or when its name
  /// no longer matches the fixture (for example after a broken-encoding seed).
  static bool needsRefresh(Patient existing, QueueDemoPatient patient) =>
      existing.birthDate == null ||
      existing.bloodType == null ||
      existing.fullName != patient.name;

  /// Full companion so both the insert and the profile refresh write every
  /// column (Drift's `replace` needs a complete row).
  static PatientsCompanion companion(
    QueueDemoPatient patient,
    String fileNumber, {
    Patient? existing,
  }) {
    return PatientsCompanion(
      id: existing == null ? const Value.absent() : Value(existing.id),
      fileNumber: Value(fileNumber),
      fullName: Value(patient.name),
      searchText: Value(patient.name),
      gender: Value(patient.gender ?? AppConstants.genderMale),
      birthDate: Value(_parseDate(patient.birthDate) ?? existing?.birthDate),
      phone: Value(patient.phone ?? existing?.phone),
      phone2: Value(patient.phone2 ?? existing?.phone2),
      address: Value(existing?.address),
      occupation: Value(existing?.occupation),
      notes: Value(existing?.notes),
      bloodType: Value(patient.bloodType ?? existing?.bloodType),
      createdAt: Value(existing?.createdAt ?? DateTime.now()),
      updatedAt: Value(DateTime.now()),
      deletedAt: Value(existing?.deletedAt),
    );
  }

  static DateTime? _parseDate(String? value) =>
      value == null ? null : DateTime.tryParse(value);
}
