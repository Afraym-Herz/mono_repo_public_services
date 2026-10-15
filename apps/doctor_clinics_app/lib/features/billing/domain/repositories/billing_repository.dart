import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';

/// Contract for billing, payments, and expenses.
abstract class IBillingRepository {
  //   Invoices
  FutureResult<List<Invoice>> getAllInvoices();
  FutureResult<List<Invoice>> getByPatient(int patientId);
  FutureResult<Invoice> createInvoice(Invoice invoice);
  FutureResult<void> addInvoiceItem(InvoiceItem item);
  FutureResult<List<InvoiceItem>> getInvoiceItems(int invoiceId);

  //   Payments
  FutureResult<List<Payment>> getPayments(int invoiceId);
  FutureResult<Payment> recordPayment(Payment payment);
  FutureResult<String> nextReceiptNumber();

  //   Debts
  FutureResult<List<Invoice>> getOutstandingInvoices();
  FutureResult<int> getPatientDebt(int patientId);

  //   Expenses (Medium)
  FutureResult<List<Expense>> getExpenses({DateTime? from, DateTime? to});
  FutureResult<Expense> addExpense(Expense expense);
  FutureResult<void> updateExpense(Expense expense);

  //   Summaries
  FutureResult<int> getDailyRevenuePiasters(DateTime date);
  FutureResult<int> getDailyExpensesPiasters(DateTime date);
}
