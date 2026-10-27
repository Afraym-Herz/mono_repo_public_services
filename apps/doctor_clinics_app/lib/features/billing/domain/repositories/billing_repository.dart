import 'package:core/core.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';

/// Contract for invoices, receipts and patient debt.
abstract class IBillingRepository {
  //   Invoices
  FutureResult<List<Invoice>> getAllInvoices();
  FutureResult<Invoice?> getInvoice(int id);
  FutureResult<List<Invoice>> getByPatient(int patientId);
  FutureResult<Invoice> createInvoice(Invoice invoice);
  FutureResult<void> addInvoiceItem(InvoiceItem item);
  FutureResult<List<InvoiceItem>> getInvoiceItems(int invoiceId);
  FutureResult<List<InvoiceItem>> getAllInvoiceItems();

  //   Payments
  FutureResult<List<Payment>> getPayments(int invoiceId);
  FutureResult<List<Payment>> getAllPayments({DateTime? from, DateTime? to});
  FutureResult<Payment> recordPayment(Payment payment);
  FutureResult<String> nextReceiptNumber();

  //   Debts
  FutureResult<List<Invoice>> getOutstandingInvoices();
  FutureResult<int> getPatientDebt(int patientId);

  //   Summaries
  FutureResult<int> getDailyRevenuePiasters(DateTime date);
}
