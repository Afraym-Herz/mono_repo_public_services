import 'package:core/src/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Icon + label row inside [AppTabButton] (see `app_tab_button.dart`).
class AppTabButtonLabel extends StatelessWidget {
  const AppTabButtonLabel({
    super.key,
    required this.label,
    required this.icon,
    required this.isActive,
    required this.contentColor,
  });

  final String label;
  final IconData? icon;
  final bool isActive;
  final Color contentColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: Dimensions.FONT_SIZE_LARGE.r, color: contentColor),
          SizedBox(width: Dimensions.PADDING_SIZE_MEDIUM_BORDER.w),
        ],
        Flexible(
          child: Text(
            label,
            style: TextStyle(
              fontSize: Dimensions.FONT_SIZE_SMALL.sp,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              color: contentColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
