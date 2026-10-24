import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Compact title bar shown above a billing table.
class BillingTableTitle extends StatelessWidget {
  const BillingTableTitle({
    super.key,
    required this.title,
    required this.icon,
    required this.countLabel,
  });

  final String title;
  final IconData icon;
  final String countLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.clinicContainer,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: Dimensions.ICON_SIZE_SMALL.r,
            color: context.clinicPrimary,
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
          Expanded(
            child: ResponsiveText(
              title,
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
              fontWeight: FontWeight.w700,
              color: context.clinicTextPrimary,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_SMALL.w,
              vertical: Dimensions.PADDING_SIZE_BORDER.h,
            ),
            decoration: BoxDecoration(
              color: context.clinicPrimary.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(
                Dimensions.RADIUS_EXTRA_LARGE.r,
              ),
            ),
            child: ResponsiveText(
              countLabel,
              fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
              fontWeight: FontWeight.w600,
              color: context.clinicPrimary,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
