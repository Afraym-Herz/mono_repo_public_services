import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_calendar.dart';

import 'appointment_view_segment.dart';

/// Segmented Day/Week/Month control for the appointments header.
///
/// The active segment sits on a raised surface pill inside a muted track — the
/// flat toggle look from the clinic header design, distinct from the filled
/// [AppTabButton] used elsewhere.
class AppointmentViewSwitcher extends StatelessWidget {
  const AppointmentViewSwitcher({
    super.key,
    required this.mode,
    required this.onChanged,
  });

  final AppointmentViewMode mode;
  final ValueChanged<AppointmentViewMode> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.CONTROL_HEIGHT.h,
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_BORDER.r),
      decoration: BoxDecoration(
        color: context.clinicContainer,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
        border: Border.all(color: context.clinicBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppointmentViewSegment(
            label: 'appointment_toolbar.day'.tr(),
            isActive: mode == AppointmentViewMode.day,
            onTap: () => onChanged(AppointmentViewMode.day),
          ),
          AppointmentViewSegment(
            label: 'appointment_toolbar.week'.tr(),
            isActive: mode == AppointmentViewMode.week,
            onTap: () => onChanged(AppointmentViewMode.week),
          ),
          AppointmentViewSegment(
            label: 'appointment_toolbar.month'.tr(),
            isActive: mode == AppointmentViewMode.month,
            onTap: () => onChanged(AppointmentViewMode.month),
          ),
        ],
      ),
    );
  }
}
