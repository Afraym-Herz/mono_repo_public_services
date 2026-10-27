import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Snapshot of the income/purchase kind of one ledger row.
class FinanceTypePill extends StatelessWidget {
  const FinanceTypePill({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    final (labelKey, color) = switch (type) {
      AppConstants.invoiceTypePatient => (
        'billing.type.patient',
        context.clinicStatusBooked,
      ),
      AppConstants.invoiceTypeSale => (
        'billing.type.sale',
        context.clinicStatusDone,
      ),
      AppConstants.invoiceTypeOtherIncome => (
        'billing.type.other_income',
        context.clinicStatusCurrent,
      ),
      AppConstants.billingTypePurchase => (
        'billing.type.purchase',
        context.clinicStatusUrgent,
      ),
      _ => ('', context.clinicTextSecondary),
    };
    if (labelKey.isEmpty) return const SizedBox.shrink();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
      ),
      child: ResponsiveText(
        labelKey.tr(),
        fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
        fontWeight: FontWeight.w600,
        color: color,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
