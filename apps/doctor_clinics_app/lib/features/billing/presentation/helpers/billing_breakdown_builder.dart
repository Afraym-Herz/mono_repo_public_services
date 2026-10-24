import 'dart:math' as math;

import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_breakdowns.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_range.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_payment.dart';

/// Builds the chart series and cash-drawer summary.
class BillingBreakdownBuilder {
  BillingBreakdownBuilder._();

  static List<BillingSeriesPoint> series({
    required BillingRange range,
    required List<Payment> payments,
    required DateTime now,
  }) {
    if (range == BillingRange.today) {
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

  static BillingCashSummary cash(
    List<Payment> payments,
    List<int> expenseAmounts, {
    List<PurchasePayment> purchasePayments = const [],
  }) {
    final cashIn = payments
        .where(
          (payment) => payment.paymentMethod == AppConstants.paymentMethodCash,
        )
        .fold<int>(0, (sum, payment) => sum + payment.amountPiasters);
    final purchaseCash = purchasePayments
        .where(
          (payment) => payment.paymentMethod == AppConstants.paymentMethodCash,
        )
        .fold<int>(0, (sum, payment) => sum + payment.amountPiasters);
    final cashOut = expenseAmounts.fold<int>(0, (sum, amount) => sum + amount) +
        purchaseCash;
    const opening = 0;
    return BillingCashSummary(
      openingPiasters: opening,
      collectedPiasters: cashIn,
      expensesPiasters: cashOut,
      expectedPiasters: opening + cashIn - cashOut,
    );
  }
}
