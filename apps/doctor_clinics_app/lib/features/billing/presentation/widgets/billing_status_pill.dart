import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_badge_style.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_format.dart';

/// Small capsule showing an invoice status.
class BillingStatusPill extends StatelessWidget {
  const BillingStatusPill({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final colors = BillingBadgeStyle.status(context, status);
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
        BillingFormat.invoiceStatus(status),
        fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
        fontWeight: FontWeight.w600,
        color: colors.foreground,
        maxLines: 1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
