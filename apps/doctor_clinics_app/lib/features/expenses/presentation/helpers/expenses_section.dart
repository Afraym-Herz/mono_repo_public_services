import 'package:flutter/material.dart';

/// Sections available on the expenses screen.
enum ExpensesSection { expenses, purchases }

extension ExpensesSectionX on ExpensesSection {
  /// Translation key used by the tab strip.
  String get labelKey => switch (this) {
    ExpensesSection.expenses => 'billing_tab.expenses',
    ExpensesSection.purchases => 'billing_tab.purchases',
  };

  /// Glyph shown next to the tab label.
  IconData get icon => switch (this) {
    ExpensesSection.expenses => Icons.wallet_outlined,
    ExpensesSection.purchases => Icons.shopping_bag_outlined,
  };
}
