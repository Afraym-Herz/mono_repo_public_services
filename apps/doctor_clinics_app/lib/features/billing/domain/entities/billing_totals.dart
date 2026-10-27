/// Aggregated revenue figures for the selected billing window.
class BillingTotals {
  const BillingTotals({
    required this.totalInvoiced,
    required this.invoiceCount,
    required this.collected,
    required this.remaining,
    required this.outstanding,
    required this.debtorCount,
    required this.topDebt,
  });

  final int totalInvoiced;
  final int invoiceCount;
  final int collected;
  final int remaining;
  final int outstanding;
  final int debtorCount;
  final int topDebt;

  int get averageInvoice =>
      invoiceCount == 0 ? 0 : totalInvoiced ~/ invoiceCount;

  /// Collection share in the `0.0`–`1.0` range.
  double get collectionRate {
    if (totalInvoiced <= 0) return 0;
    final ratio = collected / totalInvoiced;
    return ratio.clamp(0.0, 1.0).toDouble();
  }

  /// Share of the window still unpaid, in the `0.0`–`1.0` range.
  double get remainingRate {
    if (totalInvoiced <= 0) return 0;
    return (remaining / totalInvoiced).clamp(0.0, 1.0).toDouble();
  }

  /// Share of every invoice still unpaid, in the `0.0`–`1.0` range.
  double get outstandingRate {
    if (totalInvoiced <= 0) return 0;
    return (outstanding / totalInvoiced).clamp(0.0, 1.0).toDouble();
  }
}
