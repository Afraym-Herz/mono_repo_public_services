import 'package:drift/drift.dart';
import 'package:core/core.dart';

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
part 'migrations/patient_age_backfill.dart';
part 'migrations/expense_category_seed.dart';

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
    Vendors,
    Purchases,
    PurchaseItems,
    PurchasePayments,
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
  int get schemaVersion => 7;

  static QueryExecutor _openConnection() {
    return openConnection(dbName: DbConstants.dbName);
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await seedDefaultExpenseCategories(this);
    },
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
      if (from < 5) {
        await m.addColumn(patients, patients.age);
        await backfillPatientAges(this);
      }
      if (from < 6) {
        await m.addColumn(invoices, invoices.notes);
      }
      if (from < 7) {
        await m.addColumn(invoices, invoices.type);
        await m.addColumn(invoices, invoices.customerName);
        await m.addColumn(expenses, expenses.notes);
        await m.alterTable(
          TableMigration(
            invoices,
            newColumns: [invoices.patientId],
            columnTransformer: {invoices.patientId: invoices.patientId},
          ),
        );
        await m.alterTable(
          TableMigration(
            payments,
            newColumns: [payments.patientId],
            columnTransformer: {payments.patientId: payments.patientId},
          ),
        );
        await m.createTable(vendors);
        await m.createTable(purchases);
        await m.createTable(purchaseItems);
        await m.createTable(purchasePayments);
        await seedDefaultExpenseCategories(this);
      }
    },
  );
}
