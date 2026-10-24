/// Aggregated figures for the selected billing window.
class BillingTotals {
  const BillingTotals({
    required this.totalInvoiced,
    required this.invoiceCount,
    required this.collected,
    required this.remaining,
    required this.expenseTotal,
    required this.expenseCount,
    required this.purchaseTotal,
    required this.purchaseCount,
    required this.purchasesDue,
    required this.outstanding,
    required this.debtorCount,
    required this.topDebt,
  });

  final int totalInvoiced;
  final int invoiceCount;
  final int collected;
  final int remaining;
  final int expenseTotal;
  final int expenseCount;
  final int purchaseTotal;
  final int purchaseCount;

  /// Supplier money still due across all purchase bills.
  final int purchasesDue;
  final int outstanding;
  final int debtorCount;
  final int topDebt;

  /// Everything that leaves the clinic in the window.
  int get outflowTotal => expenseTotal + purchaseTotal;

  /// Number of expense rows and purchase bills in the window.
  int get outflowCount => expenseCount + purchaseCount;

  int get averageInvoice =>
      invoiceCount == 0 ? 0 : totalInvoiced ~/ invoiceCount;

  int get net => collected - outflowTotal;

  /// Collection share in the `0.0`–`1.0` range.
  double get collectionRate {
    if (totalInvoiced <= 0) return 0;
    final ratio = collected / totalInvoiced;
    return ratio.clamp(0.0, 1.0).toDouble();
  }

  /// Outflow as a share of the collected revenue.
  double get expenseRatio {
    if (collected <= 0) return 0;
    return (outflowTotal / collected).clamp(0.0, 1.0).toDouble();
  }

  /// Net surplus as a share of the collected revenue.
  double get netMargin {
    if (collected <= 0) return 0;
    return (net / collected).clamp(-1.0, 1.0).toDouble();
  }
}
