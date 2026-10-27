import 'package:flutter/material.dart';

/// Sections available on the accounts screen.
enum BillingTab { summary, payments, report }

extension BillingTabX on BillingTab {
  /// Translation key used by the tab strip.
  String get labelKey => switch (this) {
    BillingTab.summary => 'billing_tab.summary',
    BillingTab.payments => 'billing_tab.payments',
    BillingTab.report => 'billing_tab.report',
  };

  /// Glyph shown next to the tab label.
  IconData get icon => switch (this) {
    BillingTab.summary => Icons.dashboard_outlined,
    BillingTab.payments => Icons.payments_outlined,
    BillingTab.report => Icons.assessment_outlined,
  };
}
