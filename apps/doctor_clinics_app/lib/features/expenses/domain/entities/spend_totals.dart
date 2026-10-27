/// Aggregated outflow figures for the selected expenses window.
class SpendTotals {
  const SpendTotals({
    required this.expenseTotal,
    required this.expenseCount,
    required this.purchaseTotal,
    required this.purchaseCount,
    required this.purchasesDue,
  });

  final int expenseTotal;
  final int expenseCount;
  final int purchaseTotal;
  final int purchaseCount;

  /// Supplier money still due across every purchase bill.
  final int purchasesDue;

  /// Everything that leaves the clinic in the window.
  int get outflowTotal => expenseTotal + purchaseTotal;

  /// Number of expense rows plus supplier bills in the window.
  int get outflowCount => expenseCount + purchaseCount;
}
