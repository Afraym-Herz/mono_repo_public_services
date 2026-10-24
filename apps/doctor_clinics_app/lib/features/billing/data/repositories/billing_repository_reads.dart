import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';
import 'package:doctor_clinics_app/features/billing/data/repositories/billing_repository_guard.dart';
import 'package:doctor_clinics_app/features/billing/data/repositories/billing_totals.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_expense_category.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/vendor.dart';

/// Read side of [BillingRepositoryImpl], guarded into [FutureResult] values.
mixin BillingRepositoryReads {
  IBillingDatasource get datasource;

  FutureResult<List<Invoice>> getAllInvoices() =>
      guardBillingValue('getAllInvoices', datasource.fetchAllInvoices);

  FutureResult<List<Invoice>> getByPatient(int patientId) => guardBillingValue(
    'getByPatient',
    () => datasource.fetchByPatient(patientId),
  );

  FutureResult<List<InvoiceItem>> getInvoiceItems(int invoiceId) =>
      guardBillingValue(
        'getInvoiceItems',
        () => datasource.fetchInvoiceItems(invoiceId),
      );

  FutureResult<List<InvoiceItem>> getAllInvoiceItems() =>
      guardBillingValue('getAllInvoiceItems', datasource.fetchAllInvoiceItems);

  FutureResult<List<Payment>> getPayments(int invoiceId) => guardBillingValue(
    'getPayments',
    () => datasource.fetchPayments(invoiceId),
  );

  FutureResult<List<Payment>> getAllPayments({DateTime? from, DateTime? to}) =>
      guardBillingValue(
        'getAllPayments',
        () => datasource.fetchAllPayments(from: from, to: to),
      );

  FutureResult<List<Invoice>> getOutstandingInvoices() =>
      guardBillingValue('getOutstandingInvoices', datasource.fetchOutstanding);

  FutureResult<int> getPatientDebt(int patientId) => guardBillingValue(
    'getPatientDebt',
    () => sumPatientDebt(datasource, patientId),
  );

  FutureResult<List<Expense>> getExpenses({DateTime? from, DateTime? to}) =>
      guardBillingValue(
        'getExpenses',
        () => datasource.fetchExpenses(from: from, to: to),
      );

  FutureResult<List<BillingExpenseCategory>> getExpenseCategories() =>
      guardBillingValue(
        'getExpenseCategories',
        datasource.fetchExpenseCategories,
      );

  FutureResult<List<Vendor>> getVendors() =>
      guardBillingValue('getVendors', datasource.fetchAllVendors);

  FutureResult<List<Purchase>> getAllPurchases() =>
      guardBillingValue('getAllPurchases', datasource.fetchAllPurchases);

  FutureResult<List<PurchaseItem>> getAllPurchaseItems() => guardBillingValue(
    'getAllPurchaseItems',
    datasource.fetchAllPurchaseItems,
  );

  FutureResult<List<PurchasePayment>> getAllPurchasePayments() =>
      guardBillingValue(
        'getAllPurchasePayments',
        datasource.fetchAllPurchasePayments,
      );

  FutureResult<int> getDailyRevenuePiasters(DateTime date) => guardBillingValue(
    'getDailyRevenuePiasters',
    () => sumPaymentsForDay(datasource, date),
  );

  FutureResult<int> getDailyExpensesPiasters(DateTime date) =>
      guardBillingValue(
        'getDailyExpensesPiasters',
        () => sumExpensesForDay(datasource, date),
      );
}
