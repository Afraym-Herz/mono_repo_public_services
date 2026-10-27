import 'dart:math' as math;

import 'package:core/core.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/helpers/billing_status.dart';

/// Read model for the single-invoice modal: header, items and receipts.
class BillingInvoiceDetail {
  const BillingInvoiceDetail({
    required this.invoice,
    required this.partyName,
    required this.items,
    required this.payments,
  });

  final Invoice invoice;
  final String partyName;
  final List<InvoiceItem> items;
  final List<Payment> payments;

  /// Payment-aware paid total: recorded receipts win over the stored header.
  int get paidPiasters => payments.isEmpty
      ? invoice.paidPiasters
      : payments.fold(0, (sum, payment) => sum + payment.amountPiasters);

  int get duePiasters => math.max(0, invoice.totalPiasters - paidPiasters);

  int get subtotalPiasters => invoice.totalPiasters + invoice.discountPiasters;

  String get status => resolveInvoiceStatus(
    totalPiasters: invoice.totalPiasters,
    paidPiasters: paidPiasters,
    current: invoice.status,
  );

  bool get canRecordPayment =>
      duePiasters > 0 && invoice.status != AppConstants.invoiceStatusCancelled;
}
