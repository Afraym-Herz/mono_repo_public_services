import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentBookingIconBadge extends StatelessWidget {
  const AppointmentBookingIconBadge({super.key, required this.isWalkIn});

  final bool isWalkIn;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.ICON_SIZE_LARGE.r * 1.4,
      height: Dimensions.ICON_SIZE_LARGE.r * 1.4,
      decoration: BoxDecoration(
        color: context.clinicContainer,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
        border: Border.all(color: context.clinicBorder),
      ),
      child: Icon(
        isWalkIn
            ? Icons.directions_walk_rounded
            : Icons.calendar_month_outlined,
        size: Dimensions.ICON_SIZE_DEFAULT.r,
        color: context.clinicPrimary,
      ),
    );
  }
}
