import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_status_style.dart';

class AppointmentStatusChip extends StatelessWidget {
  const AppointmentStatusChip({super.key, required this.style});

  final AppointmentStatusStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: style.background,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
      ),
      child: Text(
        style.labelKey.tr(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: style.color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
