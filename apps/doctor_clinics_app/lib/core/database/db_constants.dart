/// Canonical literals for the local Drift database.
///
/// Per CLAUDE.md: no magic strings for status/collection/field names.
/// Status/type values themselves live in `AppConstants` (`package:core`);
/// this file only owns database-level defaults (name, column defaults)
/// so `app_database.dart`, `connection.dart` and table definitions share
/// a single source instead of repeating literals.
class DbConstants {
  DbConstants._();

  /// SQLite file name (single source for [AppDatabase] + `openConnection`).
  static const String dbName = 'doctor_clinics_app_db';

  /// `ClinicSettingsTable.printLanguage` default (`ar`, `en`).
  static const String printLanguageDefault = 'ar';

  /// `ClinicSettingsTable.paperSize` default (`a4`, `a5`).
  static const String paperSizeDefault = 'a4';

  /// `ClinicSettingsTable.defaultConsultationFee` default (piasters).
  static const int defaultConsultationFeeDefault = 0;

  /// `ClinicSettingsTable.slotLengthMinutes` default.
  static const int slotLengthMinutesDefault = 15;

  // ═══════════════════════════════════════════════════════════════
  // COLUMN NAMES — used in raw SQL / migration reads
  // ═══════════════════════════════════════════════════════════════
  /// `Appointments.id`
  static const String colAppointmentId = 'id';
  /// `Appointments.scheduled_date`
  static const String colScheduledDate = 'scheduled_date';
  /// `Appointments.scheduled_time`
  static const String colScheduledTime = 'scheduled_time';
  /// `QueueEntries.appointment_id`
  static const String colAppointmentIdQueue = 'appointment_id';
  /// `QueueEntries.queue_number`
  static const String colQueueNumber = 'queue_number';
  /// `QueueEntries.queue_date`
  static const String colQueueDate = 'queue_date';
}
