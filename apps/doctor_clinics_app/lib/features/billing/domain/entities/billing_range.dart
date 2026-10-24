/// Date window selected on the accounts dashboard.
enum BillingRange { today, week, month }

extension BillingRangeX on BillingRange {
  /// Inclusive start of the selected window.
  DateTime start(DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    return switch (this) {
      BillingRange.today => today,
      BillingRange.week => today.subtract(const Duration(days: 6)),
      BillingRange.month => today.subtract(const Duration(days: 29)),
    };
  }

  /// Exclusive end of the selected window (start of tomorrow).
  DateTime end(DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    return today.add(const Duration(days: 1));
  }

  /// Number of calendar days covered by the window.
  int get days => switch (this) {
    BillingRange.today => 1,
    BillingRange.week => 7,
    BillingRange.month => 30,
  };
}
