import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Rounded tile behind the KPI icon.
class OperationStatIcon extends StatelessWidget {
  const OperationStatIcon({super.key, required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.ICON_SIZE_LARGE.w,
      height: Dimensions.ICON_SIZE_LARGE.h,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
      ),
      child: Icon(icon, size: Dimensions.ICON_SIZE_SMALL.r, color: color),
    );
  }
}
