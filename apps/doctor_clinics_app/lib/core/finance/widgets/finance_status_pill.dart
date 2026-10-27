import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/finance/helpers/finance_badge_style.dart';
import 'package:doctor_clinics_app/core/finance/helpers/finance_format.dart';

/// Small capsule showing an invoice status.
class FinanceStatusPill extends StatelessWidget {
  const FinanceStatusPill({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final colors = FinanceBadgeStyle.status(context, status);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
        border: Border.all(color: colors.border),
      ),
      child: ResponsiveText(
        FinanceFormat.invoiceStatus(status),
        fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
        fontWeight: FontWeight.w600,
        color: colors.foreground,
        maxLines: 1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
