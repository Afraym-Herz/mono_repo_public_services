import 'package:drift/drift.dart';

import 'connection/connection.dart';
import 'db_constants.dart';

import 'tables/patients_table.dart';
import 'tables/appointments_table.dart';
import 'tables/consultations_table.dart';
import 'tables/prescriptions_table.dart';
import 'tables/operations_table.dart';
import 'tables/billing_table.dart';
import 'tables/users_table.dart';
import 'tables/clinic_settings_table.dart';
import 'tables/audit_logs_table.dart';

import 'daos/patient_dao.dart';
import 'daos/queue_dao.dart';
import 'daos/consultation_dao.dart';
import 'daos/prescription_dao.dart';
import 'daos/operation_dao.dart';
import 'daos/billing_dao.dart';
import 'daos/user_dao.dart';
import 'daos/settings_dao.dart';
import 'daos/audit_dao.dart';

part 'app_database.g.dart';
part 'migrations/appointment_number_backfill.dart';

@DriftDatabase(
  tables: [
    Patients,
    PatientAllergies,
    PatientConditions,
    Appointments,
    QueueEntries,
    Consultations,
    VitalSigns,
    Medicines,
    MedicinePresets,
    Prescriptions,
    PrescriptionItems,
    PrescriptionTemplates,
    Operations,
    OperationRequiredTests,
    Invoices,
    InvoiceItems,
    Payments,
    ExpenseCategories,
    Expenses,
    Users,
    ClinicSettingsTable,
    AuditLogs,
  ],
  daos: [
    PatientDao,
    QueueDao,
    ConsultationDao,
    PrescriptionDao,
    OperationDao,
    BillingDao,
    UserDao,
    SettingsDao,
    AuditDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e]) : super(e ?? _openConnection());

  @override
  int get schemaVersion => 4;

  static QueryExecutor _openConnection() {
    return openConnection(dbName: DbConstants.dbName);
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.addColumn(queueEntries, queueEntries.paidAt);
        await m.addColumn(queueEntries, queueEntries.paidAmountPiasters);
        await m.addColumn(queueEntries, queueEntries.cancelReason);
      }
      if (from < 3) {
        await m.addColumn(appointments, appointments.queueNumber);
        await backfillAppointmentQueueNumbers(this);
      }
      if (from < 4) {
        await m.addColumn(appointments, appointments.depositPiasters);
      }
    },
  );
}
