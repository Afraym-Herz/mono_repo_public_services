import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Small inline helper: icon + single-line secondary text.
class BrandingFooterItem extends StatelessWidget {
  const BrandingFooterItem({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: Dimensions.ICON_SIZE_SMALL.r, color: color),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
        ResponsiveText(
          text,
          fontSize: Dimensions.FONT_SIZE_SMALL - 1,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ],
    );
  }
}
