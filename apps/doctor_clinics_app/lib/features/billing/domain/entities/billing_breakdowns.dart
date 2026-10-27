/// One bar/point in the revenue distribution chart.
class BillingSeriesPoint {
  const BillingSeriesPoint({required this.label, required this.value});

  /// Already-numeric label (`9`, `10`, `24/10`); the widget localizes digits.
  final String label;
  final int value;
}

/// Cash-drawer reconciliation for the selected window.
class BillingCashSummary {
  const BillingCashSummary({
    required this.openingPiasters,
    required this.collectedPiasters,
    required this.expectedPiasters,
  });

  final int openingPiasters;
  final int collectedPiasters;
  final int expectedPiasters;
}
