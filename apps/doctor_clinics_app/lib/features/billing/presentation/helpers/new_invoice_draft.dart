import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';

/// Everything the new-invoice cubit needs to persist one invoice.
class NewInvoiceDraft {
  const NewInvoiceDraft({
    required this.invoice,
    required this.items,
    required this.paidPiasters,
    required this.paymentMethod,
  });

  final Invoice invoice;
  final List<InvoiceItem> items;
  final int paidPiasters;
  final String paymentMethod;
}
