import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';
import 'package:doctor_clinics_app/features/billing/data/repositories/billing_repository_guard.dart';
import 'package:doctor_clinics_app/features/billing/data/repositories/billing_totals.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';

class BillingRepositoryImpl implements IBillingRepository {
  final IBillingDatasource datasource;

  BillingRepositoryImpl({required this.datasource});

  @override
  FutureResult<List<Invoice>> getAllInvoices() =>
      guardBillingValue('getAllInvoices', datasource.fetchAllInvoices);

  @override
  FutureResult<List<Invoice>> getByPatient(int patientId) =>
      guardBillingValue('getByPatient', () => datasource.fetchByPatient(patientId));

  @override
  FutureResult<Invoice> createInvoice(Invoice invoice) => guardBillingValue(
        'createInvoice',
        () async => invoice.copyWith(id: await datasource.insertInvoice(invoice)),
      );

  @override
  FutureResult<void> addInvoiceItem(InvoiceItem item) => guardBillingVoid(
        'addInvoiceItem',
        () => datasource.insertInvoiceItem(item),
      );

  @override
  FutureResult<List<InvoiceItem>> getInvoiceItems(int invoiceId) =>
      guardBillingValue(
        'getInvoiceItems',
        () => datasource.fetchInvoiceItems(invoiceId),
      );

  @override
  FutureResult<List<Payment>> getPayments(int invoiceId) => guardBillingValue(
        'getPayments',
        () => datasource.fetchPayments(invoiceId),
      );

  @override
  FutureResult<Payment> recordPayment(Payment payment) => guardBillingValue(
        'recordPayment',
        () async => payment.copyWith(id: await datasource.insertPayment(payment)),
      );

  @override
  FutureResult<String> nextReceiptNumber() => guardBillingValue(
        'nextReceiptNumber',
        () async => 'RCP-${DateTime.now().millisecondsSinceEpoch}',
      );

  @override
  FutureResult<List<Invoice>> getOutstandingInvoices() =>
      guardBillingValue('getOutstandingInvoices', datasource.fetchOutstanding);

  @override
  FutureResult<int> getPatientDebt(int patientId) =>
      guardBillingValue('getPatientDebt', () => sumPatientDebt(datasource, patientId));

  @override
  FutureResult<List<Expense>> getExpenses({DateTime? from, DateTime? to}) =>
      guardBillingValue(
        'getExpenses',
        () => datasource.fetchExpenses(from: from, to: to),
      );

  @override
  FutureResult<Expense> addExpense(Expense expense) => guardBillingValue(
        'addExpense',
        () async => expense.copyWith(id: await datasource.insertExpense(expense)),
      );

  @override
  FutureResult<void> updateExpense(Expense expense) => guardBillingVoid(
        'updateExpense',
        () => datasource.updateExpense(expense),
      );

  @override
  FutureResult<int> getDailyRevenuePiasters(DateTime date) => guardBillingValue(
        'getDailyRevenuePiasters',
        () => sumExpensesForDay(datasource, date),
      );

  @override
  FutureResult<int> getDailyExpensesPiasters(DateTime date) =>
      guardBillingValue(
        'getDailyExpensesPiasters',
        () => sumExpensesForDay(datasource, date),
      );
}
