// ignore_for_file: constant_identifier_names

class AppConstants {
  AppConstants._();

  // ═══════════════════════════════════════════════════════════════
  // APP INFO
  // ═══════════════════════════════════════════════════════════════
  /// Non-localized fallback. User-facing titles use the `app_name` key so they
  /// follow the active locale.
  static const String appName = 'Agreements';
  static const String fontFamily = 'Ubuntu';
  static const double appVersion = 1.0;

  // ═══════════════════════════════════════════════════════════════
  // SECURE STORAGE KEYS
  // ═══════════════════════════════════════════════════════════════
  static const String TOKEN = 'token';
  static const String USER_INFO = 'user_info';

  // ═══════════════════════════════════════════════════════════════
  // SHARED PREFERENCES KEYS
  // ═══════════════════════════════════════════════════════════════
  static const String THEME = 'theme';
  static const String IS_FIRST_LAUNCH = 'is_first_launch';

  // ═══════════════════════════════════════════════════════════════
  // HIVE BOX NAMES
  // ═══════════════════════════════════════════════════════════════
  static const String settingsBox = 'settings_box';

  // ═══════════════════════════════════════════════════════════════
  // STATUS / TYPE VALUES — never inline these literals (CLAUDE.md: no magic
  // strings). Values mirror the Drift schema in
  // `apps/doctor_clinics_app/lib/core/database/tables/` + `DbConstants`.
  // ═══════════════════════════════════════════════════════════════
  // Appointments.type
  static const String appointmentTypeBooked = 'booked';
  static const String appointmentTypeWalkIn = 'walk_in';
  static const String appointmentTypeFollowUp = 'follow_up';

  // Appointments.status
  static const String appointmentStatusBooked = 'booked';
  static const String appointmentStatusArrived = 'arrived';
  static const String appointmentStatusWaiting = 'waiting';
  static const String appointmentStatusInConsultation = 'in_consultation';
  static const String appointmentStatusDone = 'done';
  static const String appointmentStatusCancelled = 'cancelled';
  static const String appointmentStatusNoShow = 'no_show';

  // QueueEntries.status
  static const String queueStatusWaiting = 'waiting';
  static const String queueStatusInConsultation = 'in_consultation';
  static const String queueStatusDone = 'done';
  static const String queueStatusCancelled = 'cancelled';
  static const String queueStatusNoShow = 'no_show';

  // Consultations.status
  static const String consultationStatusDraft = 'draft';
  static const String consultationStatusFinalized = 'finalized';

  // Operations.status
  static const String operationStatusScheduled = 'scheduled';
  static const String operationStatusCompleted = 'completed';
  static const String operationStatusCancelled = 'cancelled';

  // Invoices.status
  static const String invoiceStatusPending = 'pending';
  static const String invoiceStatusPartiallyPaid = 'partially_paid';
  static const String invoiceStatusPaid = 'paid';
  static const String invoiceStatusCancelled = 'cancelled';

  // Invoices.type
  static const String invoiceTypePatient = 'patient';
  static const String invoiceTypeSale = 'sale';
  static const String invoiceTypeOtherIncome = 'other_income';

  // Billing ledger entry kinds (invoice types + supplier purchases)
  static const String billingTypePurchase = 'purchase';

  // InvoiceItems.itemType
  static const String invoiceItemTypeConsultation = 'consultation';
  static const String invoiceItemTypeOperation = 'operation';
  static const String invoiceItemTypeMedicine = 'medicine';
  static const String invoiceItemTypeService = 'service';
  static const String invoiceItemTypeOther = 'other';

  // Payments.paymentMethod
  static const String paymentMethodCash = 'cash';
  static const String paymentMethodCard = 'card';
  static const String paymentMethodTransfer = 'transfer';

  // MedicinePresets.type
  static const String presetTypeDosage = 'dosage';
  static const String presetTypeFrequency = 'frequency';
  static const String presetTypeDuration = 'duration';
  static const String presetTypeInstruction = 'instruction';

  // Patients.gender
  static const String genderMale = 'male';
  static const String genderFemale = 'female';

  // Users.role
  static const String userRoleAdmin = 'admin';
  static const String userRoleDoctor = 'doctor';
  static const String userRoleSecretary = 'secretary';

  // ClinicSettingsTable.printLanguage / paperSize (defaults in DbConstants)
  static const String printLanguageAr = 'ar';
  static const String printLanguageEn = 'en';
  static const String paperSizeA4 = 'a4';
  static const String paperSizeA5 = 'a5';

  // QueueEntries.cancelReason
  static const String queueCancelReasonStaff = 'staff_cancelled';
  static const String queueCancelReasonRescheduled = 'rescheduled';

  // QueueEntries.status — legacy value used in migration
  static const String queueStatusArrived = 'arrived';
}
