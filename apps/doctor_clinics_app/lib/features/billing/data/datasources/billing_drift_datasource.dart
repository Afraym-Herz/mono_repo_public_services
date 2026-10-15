import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';

/// Drift-backed stub of [IBillingDatasource].
class BillingDriftDatasource implements IBillingDatasource {
  final BillingDao dao;
  BillingDriftDatasource(this.dao);

  @override
  Future<List<Invoice>> fetchAllInvoices() async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<List<Invoice>> fetchByPatient(int patientId) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> insertInvoice(Invoice invoice) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> updateInvoice(Invoice invoice) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> insertInvoiceItem(InvoiceItem item) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<List<InvoiceItem>> fetchInvoiceItems(int invoiceId) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<List<Payment>> fetchPayments(int invoiceId) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> insertPayment(Payment payment) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<List<Invoice>> fetchOutstanding() async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<List<Expense>> fetchExpenses({DateTime? from, DateTime? to}) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> insertExpense(Expense expense) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> updateExpense(Expense expense) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }
}
