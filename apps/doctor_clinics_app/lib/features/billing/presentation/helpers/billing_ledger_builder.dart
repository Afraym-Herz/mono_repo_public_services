import 'dart:math' as math;

import 'package:core/core.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_ledger_row.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';

/// Joins invoices, their payments and the party/statement lookups into the
/// rows rendered by the invoice ledger table.
class BillingLedgerBuilder {
  BillingLedgerBuilder._();

  static List<BillingLedgerRow> build({
    required List<Invoice> invoices,
    required List<Payment> allPayments,
    required Map<int, String> patientNames,
    required Map<int, String> statements,
  }) {
    final rows = invoices.map((invoice) {
      final payments =
          allPayments
              .where((payment) => payment.invoiceId == invoice.id)
              .toList()
            ..sort((a, b) => a.paymentDate.compareTo(b.paymentDate));
      final paid = payments.isEmpty
          ? invoice.paidPiasters
          : payments.fold<int>(
              0,
              (total, payment) => total + payment.amountPiasters,
            );
      final latest = payments.isEmpty ? null : payments.last;
      final due = math.max(0, invoice.totalPiasters - paid);
      final patientId = invoice.patientId;
      final patientName = patientId == null ? '' : patientNames[patientId] ?? '';
      final customerName = invoice.customerName?.trim() ?? '';
      return BillingLedgerRow(
        id: invoice.id,
        number: invoice.invoiceNumber,
        receiptNumber: latest?.receiptNumber ?? '',
        type: invoice.type,
        counterparty: invoice.type == AppConstants.invoiceTypePatient
            ? patientName
            : customerName,
        statement: statements[invoice.id] ?? '',
        totalPiasters: invoice.totalPiasters,
        paidPiasters: paid,
        duePiasters: due,
        date: latest?.paymentDate ?? invoice.invoiceDate,
        status: _status(invoice, paid, due),
      );
    }).toList();

    rows.sort((a, b) => b.date.compareTo(a.date));
    return rows;
  }

  /// Payment-aware status: an invoice with recorded payments is paid or
  /// partially paid even when the stored status has not been refreshed yet.
  static String _status(Invoice invoice, int paid, int due) {
    if (invoice.status == AppConstants.invoiceStatusCancelled) {
      return invoice.status;
    }
    if (paid <= 0) return invoice.status;
    return due <= 0
        ? AppConstants.invoiceStatusPaid
        : AppConstants.invoiceStatusPartiallyPaid;
  }

  /// First line-item description per invoice, used for the statement column.
  static Map<int, String> statements(List<InvoiceItem> items) {
    final byInvoice = <int, String>{};
    for (final item in items) {
      if (byInvoice.containsKey(item.invoiceId)) continue;
      if (item.description.trim().isEmpty) continue;
      byInvoice[item.invoiceId] = item.description;
    }
    return byInvoice;
  }
}
