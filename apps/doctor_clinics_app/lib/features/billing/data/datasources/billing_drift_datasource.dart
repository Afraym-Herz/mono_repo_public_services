import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_invoice_mapper.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_payment_expense_mapper.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart'
    as entity;

/// Concrete Drift implementation of [IBillingDatasource].
class BillingDriftDatasource implements IBillingDatasource {
  final BillingDao dao;

  BillingDriftDatasource(this.dao);

  @override
  Future<List<entity.Invoice>> fetchAllInvoices() async {
    final rows = await dao.getAllInvoices();
    return rows.map(BillingInvoiceMapper.toDomainInvoice).toList();
  }

  @override
  Future<List<entity.Invoice>> fetchByPatient(int patientId) async {
    final rows = await dao.getInvoicesForPatient(patientId);
    return rows.map(BillingInvoiceMapper.toDomainInvoice).toList();
  }

  @override
  Future<int> insertInvoice(entity.Invoice invoice) async {
    return dao.insertInvoice(BillingInvoiceMapper.toInvoiceCompanion(invoice));
  }

  @override
  Future<void> updateInvoice(entity.Invoice invoice) async {
    await dao.updateInvoice(BillingInvoiceMapper.toInvoiceCompanion(invoice));
  }

  @override
  Future<void> insertInvoiceItem(entity.InvoiceItem item) async {
    await dao.insertInvoiceItem(BillingInvoiceMapper.toItemCompanion(item));
  }

  @override
  Future<List<entity.InvoiceItem>> fetchInvoiceItems(int invoiceId) async {
    final rows = await dao.getInvoiceItems(invoiceId);
    return rows.map(BillingInvoiceMapper.toDomainItem).toList();
  }

  @override
  Future<List<entity.Payment>> fetchPayments(int invoiceId) async {
    final rows = await dao.getPaymentsForInvoice(invoiceId);
    return rows.map(BillingPaymentExpenseMapper.toDomainPayment).toList();
  }

  @override
  Future<int> insertPayment(entity.Payment payment) async {
    return dao.insertPayment(
      BillingPaymentExpenseMapper.toPaymentCompanion(payment),
    );
  }

  @override
  Future<List<entity.Invoice>> fetchOutstanding() async {
    final rows = await dao.getOutstandingInvoices();
    return rows.map(BillingInvoiceMapper.toDomainInvoice).toList();
  }

  @override
  Future<List<entity.Expense>> fetchExpenses({
    DateTime? from,
    DateTime? to,
  }) async {
    final List<Expense> rows;
    if (from != null && to != null) {
      rows = await dao.getExpensesBetween(from, to);
    } else {
      rows = await dao.getAllExpenses();
    }
    return rows.map(BillingPaymentExpenseMapper.toDomainExpense).toList();
  }

  @override
  Future<int> insertExpense(entity.Expense expense) async {
    return dao.insertExpense(
      BillingPaymentExpenseMapper.toExpenseCompanion(expense),
    );
  }

  @override
  Future<void> updateExpense(entity.Expense expense) async {
    await dao.updateExpense(
      BillingPaymentExpenseMapper.toExpenseCompanion(expense),
    );
  }
}
