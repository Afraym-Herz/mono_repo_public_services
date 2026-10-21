import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_calendar.dart';

import 'appointment_month_day_cell.dart';

/// One row of seven day cells.
///
/// The row keeps the dense design height as a minimum but grows with its
/// tallest cell, so patient chips never overflow on short viewports where the
/// ScreenUtil height scale is smaller than the text scale.
class AppointmentMonthWeek extends StatelessWidget {
  const AppointmentMonthWeek({
    super.key,
    required this.days,
    required this.items,
    required this.anchor,
    required this.today,
    required this.onDaySelected,
  });

  final List<DateTime> days;
  final List<AppointmentListItem> items;
  final DateTime anchor;
  final DateTime today;
  final ValueChanged<DateTime> onDaySelected;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: Dimensions.APPOINTMENT_MONTH_CELL_HEIGHT.h,
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var index = 0; index < days.length; index++) ...[
              Expanded(child: _cell(day: days[index])),
              if (index < days.length - 1)
                SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
            ],
          ],
        ),
      ),
    );
  }

  Widget _cell({required DateTime day}) => AppointmentMonthDayCell(
    day: day,
    items: items
        .where((item) => AppointmentCalendar.isSameDay(item.scheduledDate, day))
        .toList(growable: false),
    isToday: AppointmentCalendar.isSameDay(day, today),
    isCurrentMonth: AppointmentCalendar.isSameMonth(day, anchor),
    isWeekend: day.weekday == DateTime.friday,
    onTap: () => onDaySelected(day),
  );
}
