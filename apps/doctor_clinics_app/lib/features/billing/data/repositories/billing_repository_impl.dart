import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';

class BillingRepositoryImpl implements IBillingRepository {
  final IBillingDatasource datasource;

  BillingRepositoryImpl({required this.datasource});

  @override
  Future<List<Invoice>> getAllInvoices() {
    throw UnimplementedError();
  }

  @override
  Future<List<Invoice>> getByPatient(int patientId) {
    throw UnimplementedError();
  }

  @override
  Future<Invoice> createInvoice(Invoice invoice) {
    throw UnimplementedError();
  }

  @override
  Future<void> addInvoiceItem(InvoiceItem item) {
    throw UnimplementedError();
  }

  @override
  Future<List<InvoiceItem>> getInvoiceItems(int invoiceId) {
    throw UnimplementedError();
  }

  @override
  Future<List<Payment>> getPayments(int invoiceId) {
    throw UnimplementedError();
  }

  @override
  Future<Payment> recordPayment(Payment payment) {
    throw UnimplementedError();
  }

  @override
  Future<String> nextReceiptNumber() {
    throw UnimplementedError();
  }

  @override
  Future<List<Invoice>> getOutstandingInvoices() {
    throw UnimplementedError();
  }

  @override
  Future<int> getPatientDebt(int patientId) {
    throw UnimplementedError();
  }

  @override
  Future<List<Expense>> getExpenses({
    DateTime? from,
    DateTime? to,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Expense> addExpense(Expense expense) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateExpense(Expense expense) {
    throw UnimplementedError();
  }

  @override
  Future<int> getDailyRevenuePiasters(DateTime date) {
    throw UnimplementedError();
  }

  @override
  Future<int> getDailyExpensesPiasters(DateTime date) {
    throw UnimplementedError();
  }
}