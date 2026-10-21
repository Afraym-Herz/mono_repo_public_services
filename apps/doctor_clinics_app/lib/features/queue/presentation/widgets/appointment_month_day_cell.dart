import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';

import 'appointment_month_chip.dart';
import 'appointment_month_day_header.dart';
import 'appointment_month_more.dart';

/// Dense day card in the month grid: number, booking count and the first two
/// patient chips. The rest of the day is one tap away in the Day view.
class AppointmentMonthDayCell extends StatelessWidget {
  const AppointmentMonthDayCell({
    super.key,
    required this.day,
    required this.items,
    required this.isToday,
    required this.isCurrentMonth,
    required this.isWeekend,
    required this.onTap,
  });

  final DateTime day;
  final List<AppointmentListItem> items;
  final bool isToday;
  final bool isCurrentMonth;
  final bool isWeekend;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hidden = items.length > 2 ? items.length - 2 : 0;
    final radius = BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r);
    final surface = context.clinicIsDark
        ? AppColors.clinicBackgroundDark
        : AppColors.surfaceWhite;
    return Material(
      color: isWeekend || !isCurrentMonth ? context.clinicContainer : surface,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL.r),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color: isToday ? context.clinicPrimary : context.clinicBorder,
              width: isToday
                  ? Dimensions.PADDING_SIZE_BORDER / 2
                  : Dimensions.PADDING_SIZE_CARD,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppointmentMonthDayHeader(
                day: day,
                count: items.length,
                isToday: isToday,
                isCurrentMonth: isCurrentMonth,
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
              for (final item in items.take(2))
                AppointmentMonthChip(item: item),
              if (hidden > 0) AppointmentMonthMore(hidden: hidden),
            ],
          ),
        ),
      ),
    );
  }
}
