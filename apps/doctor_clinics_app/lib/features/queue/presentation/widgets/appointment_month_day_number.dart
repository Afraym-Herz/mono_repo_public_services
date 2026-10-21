import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Circular day number in a month cell. Today is filled; other-month days stay
/// muted so the current month reads first.
class AppointmentMonthDayNumber extends StatelessWidget {
  const AppointmentMonthDayNumber({
    super.key,
    required this.number,
    required this.isToday,
    required this.isCurrentMonth,
  });

  final String number;
  final bool isToday;
  final bool isCurrentMonth;

  @override
  Widget build(BuildContext context) {
    final size = Dimensions.CONTROL_HEIGHT.r * 0.7;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isToday ? context.clinicPrimary : AppColors.transparent,
        shape: BoxShape.circle,
      ),
      child: Text(
        number,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: isToday
              ? AppColors.surfaceWhite
              : isCurrentMonth
              ? context.clinicTextPrimary
              : context.clinicTextSecondary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
