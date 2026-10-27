/// Date window selected on the accounts dashboard.
enum FinanceRange { today, week, month }

extension FinanceRangeX on FinanceRange {
  /// Inclusive start of the selected window.
  DateTime start(DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    return switch (this) {
      FinanceRange.today => today,
      FinanceRange.week => today.subtract(const Duration(days: 6)),
      FinanceRange.month => today.subtract(const Duration(days: 29)),
    };
  }

  /// Exclusive end of the selected window (start of tomorrow).
  DateTime end(DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    return today.add(const Duration(days: 1));
  }

  /// Number of calendar days covered by the window.
  int get days => switch (this) {
    FinanceRange.today => 1,
    FinanceRange.week => 7,
    FinanceRange.month => 30,
  };
}
