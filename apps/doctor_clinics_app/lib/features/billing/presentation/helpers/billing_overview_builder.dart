import 'package:core/core.dart';

import 'package:doctor_clinics_app/core/finance/domain/finance_range.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_overview.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';

import 'billing_breakdown_builder.dart';
import 'billing_ledger_builder.dart';
import 'billing_totals_calculator.dart';

/// Turns the raw revenue rows into the range-scoped [BillingOverview] the
/// accounts screen renders.
class BillingOverviewBuilder {
  BillingOverviewBuilder._();

  static BillingOverview build({
    required FinanceRange range,
    required List<Invoice> invoices,
    required List<Payment> payments,
    required List<InvoiceItem> items,
    required Map<int, String> patientNames,
    required DateTime now,
  }) {
    final start = range.start(now);
    final end = range.end(now);
    final activeInvoices = invoices
        .where(
          (invoice) => invoice.status != AppConstants.invoiceStatusCancelled,
        )
        .toList();
    final activeIds = activeInvoices.map((invoice) => invoice.id).toSet();
    final windowInvoices = activeInvoices
        .where((invoice) => _within(invoice.invoiceDate, start, end))
        .toList();
    final windowPayments = payments
        .where(
          (payment) =>
              activeIds.contains(payment.invoiceId) &&
              _within(payment.paymentDate, start, end),
        )
        .toList();
    final paymentInvoiceIds = windowPayments
        .map((payment) => payment.invoiceId)
        .toSet();
    final ledgerInvoices = activeInvoices
        .where(
          (invoice) =>
              _within(invoice.invoiceDate, start, end) ||
              paymentInvoiceIds.contains(invoice.id),
        )
        .toList();

    final totals = BillingTotalsCalculator.calculate(
      invoices: windowInvoices,
      allInvoices: activeInvoices,
      payments: windowPayments,
      allPayments: payments,
    );

    return BillingOverview(
      range: range,
      totals: totals,
      ledgerRows: BillingLedgerBuilder.build(
        invoices: ledgerInvoices,
        allPayments: payments,
        patientNames: patientNames,
        statements: BillingLedgerBuilder.statements(items),
      ),
      series: BillingBreakdownBuilder.series(
        range: range,
        payments: windowPayments,
        now: now,
      ),
      cash: BillingBreakdownBuilder.cash(windowPayments),
      invoices: windowInvoices,
    );
  }

  static bool _within(DateTime value, DateTime start, DateTime end) =>
      !value.isBefore(start) && value.isBefore(end);
}
