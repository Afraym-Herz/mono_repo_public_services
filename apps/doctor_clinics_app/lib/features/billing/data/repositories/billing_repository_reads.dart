import 'package:core/core.dart';

import 'package:doctor_clinics_app/core/finance/data/finance_guard.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';
import 'package:doctor_clinics_app/features/billing/data/repositories/billing_totals.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';

/// Read side of [BillingRepositoryImpl], guarded into [FutureResult] values.
mixin BillingRepositoryReads {
  IBillingDatasource get datasource;

  FutureResult<List<Invoice>> getAllInvoices() =>
      guardFinanceValue('getAllInvoices', datasource.fetchAllInvoices);

  FutureResult<Invoice?> getInvoice(int id) =>
      guardFinanceValue('getInvoice', () => datasource.fetchInvoice(id));

  FutureResult<List<Invoice>> getByPatient(int patientId) => guardFinanceValue(
    'getByPatient',
    () => datasource.fetchByPatient(patientId),
  );

  FutureResult<List<InvoiceItem>> getInvoiceItems(int invoiceId) =>
      guardFinanceValue(
        'getInvoiceItems',
        () => datasource.fetchInvoiceItems(invoiceId),
      );

  FutureResult<List<InvoiceItem>> getAllInvoiceItems() =>
      guardFinanceValue('getAllInvoiceItems', datasource.fetchAllInvoiceItems);

  FutureResult<List<Payment>> getPayments(int invoiceId) => guardFinanceValue(
    'getPayments',
    () => datasource.fetchPayments(invoiceId),
  );

  FutureResult<List<Payment>> getAllPayments({DateTime? from, DateTime? to}) =>
      guardFinanceValue(
        'getAllPayments',
        () => datasource.fetchAllPayments(from: from, to: to),
      );

  FutureResult<List<Invoice>> getOutstandingInvoices() =>
      guardFinanceValue('getOutstandingInvoices', datasource.fetchOutstanding);

  FutureResult<int> getPatientDebt(int patientId) => guardFinanceValue(
    'getPatientDebt',
    () => sumPatientDebt(datasource, patientId),
  );

  FutureResult<int> getDailyRevenuePiasters(DateTime date) => guardFinanceValue(
    'getDailyRevenuePiasters',
    () => sumPaymentsForDay(datasource, date),
  );
}
