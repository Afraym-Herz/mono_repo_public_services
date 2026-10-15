import 'package:core/src/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Coloured header row for [AppSectionCard] (see `app_section_card.dart`).
class AppSectionCardHeader extends StatelessWidget {
  const AppSectionCardHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.primary,
    required this.headerColor,
    required this.trailing,
  });

  final IconData icon;
  final String title;
  final Color primary;
  final Color? headerColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSizeDefault.w,
        vertical: Dimensions.PADDING_SIZE_SMALL.h,
      ),
      decoration: BoxDecoration(
        color: headerColor ?? primary.withValues(alpha: isDark ? 0.15 : 0.07),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.RADIUS_LARGE.r),
          topRight: Radius.circular(Dimensions.RADIUS_LARGE.r),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: Dimensions.ICON_SIZE_SMALL.r, color: primary),
          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: Dimensions.FONT_SIZE_DEFAULT.sp,
                fontWeight: FontWeight.w700,
                color: primary,
              ),
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}
