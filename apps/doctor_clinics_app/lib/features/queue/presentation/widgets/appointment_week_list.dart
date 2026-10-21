import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_calendar.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_sort.dart';
import 'appointment_week_section.dart';

/// Saturday-first week. Every one of the seven days is rendered, even empty.
class AppointmentWeekList extends StatelessWidget {
  const AppointmentWeekList({
    super.key,
    required this.anchor,
    required this.items,
    required this.canManage,
  });

  final DateTime anchor;
  final List<AppointmentListItem> items;
  final bool canManage;

  @override
  Widget build(BuildContext context) {
    final days = AppointmentCalendar.weekDays(anchor);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        Dimensions.PADDING_SIZE_LARGE.w,
        Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
        Dimensions.PADDING_SIZE_LARGE.w,
        Dimensions.PADDING_SIZE_LARGE.h,
      ),
      children: [
        for (final day in days)
          AppointmentWeekSection(
            day: day,
            items: sortByQueueNumber(
              items.where(
                (item) =>
                    AppointmentCalendar.isSameDay(item.scheduledDate, day),
              ),
            ),
            canManage: canManage,
          ),
      ],
    );
  }
}
