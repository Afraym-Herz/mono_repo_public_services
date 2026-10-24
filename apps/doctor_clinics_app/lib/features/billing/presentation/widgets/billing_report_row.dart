import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// One label/value line inside a report card.
class BillingReportRow extends StatelessWidget {
  const BillingReportRow({
    super.key,
    required this.label,
    required this.value,
    this.color,
    this.icon,
  });

  final String label;
  final String value;
  final Color? color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final accent = color ?? context.clinicPrimary;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL.h),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: Dimensions.ICON_SIZE_EXTRA_SMALL.r, color: accent),
            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
          ],
          Expanded(
            child: ResponsiveText(
              label,
              fontSize: Dimensions.FONT_SIZE_SMALL,
              color: context.clinicTextSecondary,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Flexible(
            child: ResponsiveText(
              value,
              fontSize: Dimensions.FONT_SIZE_SMALL,
              fontWeight: FontWeight.w700,
              color: accent,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
