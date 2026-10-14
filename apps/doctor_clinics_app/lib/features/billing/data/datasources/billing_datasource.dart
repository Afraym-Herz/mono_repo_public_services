import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';

/// Local data-source for billing (Drift).
abstract class IBillingDatasource {
  Future<List<Invoice>> fetchAllInvoices();
  Future<List<Invoice>> fetchByPatient(int patientId);
  Future<int> insertInvoice(Invoice invoice);
  Future<void> updateInvoice(Invoice invoice);

  Future<void> insertInvoiceItem(InvoiceItem item);
  Future<List<InvoiceItem>> fetchInvoiceItems(int invoiceId);

  Future<List<Payment>> fetchPayments(int invoiceId);
  Future<int> insertPayment(Payment payment);

  Future<List<Invoice>> fetchOutstanding();

  Future<List<Expense>> fetchExpenses({
    DateTime? from,
    DateTime? to,
  });
  Future<int> insertExpense(Expense expense);
  Future<void> updateExpense(Expense expense);
}