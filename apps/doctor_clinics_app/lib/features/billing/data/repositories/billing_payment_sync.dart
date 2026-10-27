import 'dart:math' as math;

import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/helpers/billing_status.dart';

/// Inserts an invoice receipt and re-syncs the invoice paid/due/status header.
Future<Payment> insertPaymentWithSync(
  IBillingDatasource datasource,
  Payment payment,
) async {
  final id = await datasource.insertPayment(payment);
  final invoice = await datasource.fetchInvoice(payment.invoiceId);
  if (invoice != null) {
    final paid = invoice.paidPiasters + payment.amountPiasters;
    await datasource.updateInvoice(
      invoice.copyWith(
        paidPiasters: paid,
        duePiasters: math.max(0, invoice.totalPiasters - paid),
        status: resolveInvoiceStatus(
          totalPiasters: invoice.totalPiasters,
          paidPiasters: paid,
          current: invoice.status,
        ),
        updatedAt: DateTime.now(),
      ),
    );
  }
  return payment.copyWith(id: id);
}
