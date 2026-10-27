import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:core/core.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/features/billing/data/demo/billing_demo_seeder.dart';
import 'package:doctor_clinics_app/features/expenses/data/demo/expenses_demo_seeder.dart';
import 'package:doctor_clinics_app/features/queue/data/demo/demo_today_seed.dart';

/// The accounts seeder must bill the demo appointments/queue visits instead of
/// inventing unrelated rows.
void main() {
  test(
    'BillingDemoSeeder bills demo queue visits and ExpensesDemoSeeder seeds '
    'expenses',
    () async {
      final db = AppDatabase(NativeDatabase.memory());
      addTearDown(db.close);
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      final patientId = await db.patientDao.insertPatient(
        PatientsCompanion.insert(
          fileNumber: '1129',
          fullName: 'Demo Patient',
          searchText: 'Demo Patient',
          gender: AppConstants.genderMale,
        ),
      );
      final appointmentId = await db.queueDao.insertAppointment(
        AppointmentsCompanion.insert(
          patientId: patientId,
          scheduledDate: today,
          scheduledTime: '',
          queueNumber: const Value(1),
          type: AppConstants.appointmentTypeWalkIn,
          status: AppConstants.appointmentStatusDone,
          depositPiasters: const Value(5000),
          createdBy: DemoTodaySeed.marker,
        ),
      );
      await db.queueDao.insertQueueEntry(
        QueueEntriesCompanion.insert(
          appointmentId: Value(appointmentId),
          patientId: patientId,
          queueDate: today,
          queueNumber: 1,
          position: 1,
          status: AppConstants.queueStatusDone,
          paidAmountPiasters: const Value(10000),
        ),
      );

      await BillingDemoSeeder(
        billingDao: db.billingDao,
        queueDao: db.queueDao,
      ).seedIfEmpty();
      await ExpensesDemoSeeder(billingDao: db.billingDao).seedIfEmpty();

      final invoices = await db.billingDao.getAllInvoices();
      expect(invoices, hasLength(1));
      expect(invoices.single.invoiceNumber, 'DEMO-VISIT-$appointmentId');
      expect(invoices.single.totalAmount, 40000);
      expect(invoices.single.netAmount, 15000);
      expect(invoices.single.status, AppConstants.invoiceStatusPartiallyPaid);

      final payments = await db.billingDao.getAllPayments();
      expect(
        payments.fold<int>(0, (total, payment) => total + payment.amount),
        15000,
      );

      expect(await db.billingDao.getAllInvoiceItems(), hasLength(1));
      expect(await db.billingDao.getAllExpenses(), isNotEmpty);
      expect(await db.billingDao.getExpenseCategories(), isNotEmpty);

      // Re-running the seeders must not duplicate rows.
      await BillingDemoSeeder(
        billingDao: db.billingDao,
        queueDao: db.queueDao,
      ).seedIfEmpty();
      await ExpensesDemoSeeder(billingDao: db.billingDao).seedIfEmpty();
      expect(await db.billingDao.getAllInvoices(), hasLength(1));
      expect(await db.billingDao.getAllPayments(), hasLength(payments.length));
      expect(await db.billingDao.getAllExpenses(), hasLength(6));
    },
  );
}
