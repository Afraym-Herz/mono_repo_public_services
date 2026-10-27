import 'package:doctor_clinics_app/core/finance/domain/finance_range.dart';
import 'package:doctor_clinics_app/core/finance/domain/ledger_row.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_breakdowns.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_totals.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';

/// Revenue read model consumed by the accounts dashboard.
class BillingOverview {
  const BillingOverview({
    required this.range,
    required this.totals,
    required this.ledgerRows,
    required this.series,
    required this.cash,
    required this.invoices,
  });

  final FinanceRange range;
  final BillingTotals totals;
  final List<LedgerRow> ledgerRows;
  final List<BillingSeriesPoint> series;
  final BillingCashSummary cash;
  final List<Invoice> invoices;

  bool get isEmpty => invoices.isEmpty && ledgerRows.isEmpty;
}
