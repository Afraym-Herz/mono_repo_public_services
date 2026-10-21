import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_calendar.dart';

import 'appointment_month_week.dart';
import 'appointment_month_weekdays.dart';

/// Saturday-first six-week calendar for the Month segment.
///
/// Tapping a day opens that day in the Day view, which keeps the detailed
/// secretary actions out of the dense grid.
class AppointmentMonthView extends StatelessWidget {
  const AppointmentMonthView({
    super.key,
    required this.anchor,
    required this.items,
    required this.onDaySelected,
  });

  final DateTime anchor;
  final List<AppointmentListItem> items;
  final ValueChanged<DateTime> onDaySelected;

  @override
  Widget build(BuildContext context) {
    final weeks = AppointmentCalendar.monthGridWeeks(anchor);
    final today = AppointmentCalendar.dayOf(DateTime.now());
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        Dimensions.PADDING_SIZE_LARGE.w,
        Dimensions.PADDING_SIZE_SMALL.h,
        Dimensions.PADDING_SIZE_LARGE.w,
        Dimensions.PADDING_SIZE_LARGE.h,
      ),
      child: FadeInUp(
        duration: const Duration(milliseconds: 300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppointmentMonthWeekdays(days: weeks.first),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
            for (final week in weeks)
              Padding(
                padding: EdgeInsets.only(
                  bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
                ),
                child: AppointmentMonthWeek(
                  days: week,
                  items: items,
                  anchor: anchor,
                  today: today,
                  onDaySelected: onDaySelected,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
