import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Small capsule showing an expense category.
class BillingCategoryPill extends StatelessWidget {
  const BillingCategoryPill({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: context.clinicAccent.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
      ),
      child: ResponsiveText(
        label,
        fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
        fontWeight: FontWeight.w600,
        color: context.clinicAccent,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
