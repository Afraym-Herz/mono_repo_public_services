import 'dart:math' as math;

import 'package:core/core.dart';
import 'package:doctor_clinics_app/core/finance/domain/finance_range.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_breakdowns.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';

/// Builds the revenue chart series and cash-drawer summary.
class BillingBreakdownBuilder {
  BillingBreakdownBuilder._();

  static List<BillingSeriesPoint> series({
    required FinanceRange range,
    required List<Payment> payments,
    required DateTime now,
  }) {
    if (range == FinanceRange.today) {
      final hours = payments.map((payment) => payment.paymentDate.hour);
      final firstHour = hours.isEmpty ? 8 : math.min(8, hours.reduce(math.min));
      final lastHour = hours.isEmpty
          ? 20
          : math.max(20, hours.reduce(math.max));
      return List.generate(lastHour - firstHour + 1, (index) {
        final hour = firstHour + index;
        final value = payments
            .where((payment) => payment.paymentDate.hour == hour)
            .fold(0, (total, payment) => total + payment.amountPiasters);
        return BillingSeriesPoint(label: '$hour', value: value);
      });
    }

    final start = range.start(now);
    return List.generate(range.days, (index) {
      final day = start.add(Duration(days: index));
      final value = payments
          .where((payment) {
            final date = payment.paymentDate;
            return date.year == day.year &&
                date.month == day.month &&
                date.day == day.day;
          })
          .fold(0, (total, payment) => total + payment.amountPiasters);
      return BillingSeriesPoint(label: '${day.day}/${day.month}', value: value);
    });
  }

  static BillingCashSummary cash(List<Payment> payments) {
    final cashIn = payments
        .where(
          (payment) => payment.paymentMethod == AppConstants.paymentMethodCash,
        )
        .fold<int>(0, (sum, payment) => sum + payment.amountPiasters);
    const opening = 0;
    return BillingCashSummary(
      openingPiasters: opening,
      collectedPiasters: cashIn,
      expectedPiasters: opening + cashIn,
    );
  }
}
