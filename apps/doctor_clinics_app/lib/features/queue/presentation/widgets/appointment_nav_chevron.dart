import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Chevron button used by [AppointmentPeriodNav] to step the schedule.
class AppointmentNavChevron extends StatelessWidget {
  const AppointmentNavChevron({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(Dimensions.RADIUS_SMALL.r);
    return Material(
      color: AppColors.transparent,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Tooltip(
          message: tooltip,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_MEDIUM_BORDER.w,
              vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
            ),
            child: Icon(
              icon,
              size: Dimensions.ICON_SIZE_SMALL.r,
              color: context.clinicTextSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
