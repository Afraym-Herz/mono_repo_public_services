import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';

/// Contract for billing, payments, and expenses.
abstract class IBillingRepository {
  //   Invoices
  Future<List<Invoice>> getAllInvoices();
  Future<List<Invoice>> getByPatient(int patientId);
  Future<Invoice> createInvoice(Invoice invoice);
  Future<void> addInvoiceItem(InvoiceItem item);
  Future<List<InvoiceItem>> getInvoiceItems(int invoiceId);

  //   Payments
  Future<List<Payment>> getPayments(int invoiceId);
  Future<Payment> recordPayment(Payment payment);
  Future<String> nextReceiptNumber();

  //   Debts
  Future<List<Invoice>> getOutstandingInvoices();
  Future<int> getPatientDebt(int patientId);

  //   Expenses (Medium)
  Future<List<Expense>> getExpenses({DateTime? from, DateTime? to});
  Future<Expense> addExpense(Expense expense);
  Future<void> updateExpense(Expense expense);

  //   Summaries
  Future<int> getDailyRevenuePiasters(DateTime date);
  Future<int> getDailyExpensesPiasters(DateTime date);
}
