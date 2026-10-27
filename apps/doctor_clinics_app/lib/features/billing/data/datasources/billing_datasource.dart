import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';

/// Local data-source for invoices, invoice items and receipts (Drift).
abstract class IBillingDatasource {
  Future<List<Invoice>> fetchAllInvoices();
  Future<Invoice?> fetchInvoice(int id);
  Future<List<Invoice>> fetchByPatient(int patientId);
  Future<int> insertInvoice(Invoice invoice);
  Future<void> updateInvoice(Invoice invoice);

  Future<void> insertInvoiceItem(InvoiceItem item);
  Future<List<InvoiceItem>> fetchInvoiceItems(int invoiceId);
  Future<List<InvoiceItem>> fetchAllInvoiceItems();

  Future<List<Payment>> fetchPayments(int invoiceId);
  Future<List<Payment>> fetchAllPayments({DateTime? from, DateTime? to});
  Future<int> insertPayment(Payment payment);

  Future<List<Invoice>> fetchOutstanding();
}
