import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';
import 'package:doctor_clinics_app/features/patients/presentation/helpers/open_patient_profile.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_calendar.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_sort.dart';
import 'appointment_day_heading.dart';
import 'appointment_empty_state.dart';
import 'appointment_row.dart';

class AppointmentDayList extends StatelessWidget {
  const AppointmentDayList({
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
    final dayItems = sortByQueueNumber(
      items.where(
        (item) => AppointmentCalendar.isSameDay(item.scheduledDate, anchor),
      ),
    );
    if (dayItems.isEmpty) return AppointmentEmptyState(canBook: canManage);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        Dimensions.PADDING_SIZE_LARGE.w,
        Dimensions.PADDING_SIZE_SMALL.h,
        Dimensions.PADDING_SIZE_LARGE.w,
        Dimensions.PADDING_SIZE_LARGE.h,
      ),
      children: [
        AppointmentDayHeading(
          date: anchor,
          count: dayItems.length,
          showDate: false,
        ),
        for (final item in dayItems)
          AppointmentRow(
            item: item,
            canManage: canManage,
            onTap: () => openPatientProfileById(context, item.patientId),
          ),
      ],
    );
  }
}
