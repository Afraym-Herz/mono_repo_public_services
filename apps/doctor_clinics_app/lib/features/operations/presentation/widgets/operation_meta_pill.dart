import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Compact icon + caption chip used in operation card metadata rows.
class OperationMetaPill extends StatelessWidget {
  const OperationMetaPill({
    super.key,
    required this.icon,
    required this.label,
    this.color,
  });

  final IconData icon;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final tint = color ?? context.clinicTextSecondary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: Dimensions.ICON_SIZE_EXTRA_SMALL.r, color: tint),
        SizedBox(width: Dimensions.PADDING_SIZE_BORDER.w),
        ResponsiveText(
          label,
          fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
          fontWeight: FontWeight.w600,
          color: tint,
          maxLines: 1,
        ),
      ],
    );
  }
}
