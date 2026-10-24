import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_invoice_mapper.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_payment_expense_mapper.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_expense_category.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart'
    as entity;

/// Read queries of [BillingDriftDatasource], kept apart from its writes.
mixin BillingDriftReads {
  BillingDao get dao;

  Future<List<entity.Invoice>> fetchAllInvoices() async {
    final rows = await dao.getAllInvoices();
    return rows.map(BillingInvoiceMapper.toDomainInvoice).toList();
  }

  Future<List<entity.Invoice>> fetchByPatient(int patientId) async {
    final rows = await dao.getInvoicesForPatient(patientId);
    return rows.map(BillingInvoiceMapper.toDomainInvoice).toList();
  }

  Future<List<entity.InvoiceItem>> fetchInvoiceItems(int invoiceId) async {
    final rows = await dao.getInvoiceItems(invoiceId);
    return rows.map(BillingInvoiceMapper.toDomainItem).toList();
  }

  Future<List<entity.InvoiceItem>> fetchAllInvoiceItems() async {
    final rows = await dao.getAllInvoiceItems();
    return rows.map(BillingInvoiceMapper.toDomainItem).toList();
  }

  Future<List<entity.Payment>> fetchPayments(int invoiceId) async {
    final rows = await dao.getPaymentsForInvoice(invoiceId);
    return rows.map(BillingPaymentExpenseMapper.toDomainPayment).toList();
  }

  Future<List<entity.Payment>> fetchAllPayments({
    DateTime? from,
    DateTime? to,
  }) async {
    final rows = from != null && to != null
        ? await dao.getPaymentsBetween(from, to)
        : await dao.getAllPayments();
    return rows.map(BillingPaymentExpenseMapper.toDomainPayment).toList();
  }

  Future<List<entity.Invoice>> fetchOutstanding() async {
    final rows = await dao.getOutstandingInvoices();
    return rows.map(BillingInvoiceMapper.toDomainInvoice).toList();
  }

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

  Future<List<entity.BillingExpenseCategory>> fetchExpenseCategories() async {
    final rows = await dao.getExpenseCategories();
    return rows.map(BillingPaymentExpenseMapper.toDomainCategory).toList();
  }
}
