import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/patients/presentation/helpers/open_patient_profile.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';
import 'appointment_day_heading.dart';
import 'appointment_row.dart';

class AppointmentWeekSection extends StatelessWidget {
  const AppointmentWeekSection({
    super.key,
    required this.day,
    required this.items,
    required this.canManage,
  });

  final DateTime day;
  final List<AppointmentListItem> items;
  final bool canManage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppointmentDayHeading(date: day, count: items.length),
        if (items.isEmpty)
          Padding(
            padding: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL.h),
            child: Text(
              'appointment_week.empty_day'.tr(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: context.clinicTextSecondary,
                fontStyle: FontStyle.italic,
              ),
            ),
          )
        else
          for (final item in items)
            AppointmentRow(
              item: item,
              canManage: canManage,
              onTap: () => openPatientProfileById(context, item.patientId),
            ),
      ],
    );
  }
}
