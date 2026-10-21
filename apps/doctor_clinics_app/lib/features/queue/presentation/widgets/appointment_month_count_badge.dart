import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Compact booking-count pill in a month day cell. Digits are localized by the
/// caller.
class AppointmentMonthCountBadge extends StatelessWidget {
  const AppointmentMonthCountBadge({super.key, required this.count});

  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_BORDER.w,
        vertical: Dimensions.PADDING_SIZE_CARD.h,
      ),
      decoration: BoxDecoration(
        color: context.clinicNavActiveBackground,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
      ),
      child: Text(
        count,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.clinicPrimary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
