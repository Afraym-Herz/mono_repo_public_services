import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Tinted glyph plus metric label at the top of a KPI card.
class BillingKpiHeader extends StatelessWidget {
  const BillingKpiHeader({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: Dimensions.ICON_SIZE_DEFAULT.r,
          height: Dimensions.ICON_SIZE_DEFAULT.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
          ),
          child: Icon(icon, size: Dimensions.ICON_SIZE_SMALL.r, color: color),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
        Expanded(
          child: ResponsiveText(
            title,
            fontSize: Dimensions.FONT_SIZE_SMALL,
            fontWeight: FontWeight.w600,
            color: context.clinicTextSecondary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
