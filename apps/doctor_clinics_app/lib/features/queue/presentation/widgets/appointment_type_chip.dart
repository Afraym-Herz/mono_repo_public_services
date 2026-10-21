import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Compact badge that tells the secretary how the patient got on the schedule:
/// a prior booking, a same-day walk-in, or a follow-up visit.
class AppointmentTypeChip extends StatelessWidget {
  const AppointmentTypeChip({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    final style = _styleFor(type);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: style.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
        border: Border.all(color: style.color.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            style.icon,
            size: Dimensions.ICON_SIZE_EXTRA_SMALL.r,
            color: style.color,
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_BORDER.w),
          ResponsiveText(
            style.labelKey.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL,
            fontWeight: FontWeight.w600,
            color: style.color,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  _TypeStyle _styleFor(String type) {
    switch (type) {
      case AppConstants.appointmentTypeBooked:
        return const _TypeStyle(
          labelKey: 'appointment_type.booked',
          icon: Icons.event_available_rounded,
          color: AppColors.clinicPrimary,
        );
      case AppConstants.appointmentTypeWalkIn:
        return const _TypeStyle(
          labelKey: 'appointment_type.walk_in',
          icon: Icons.directions_walk_rounded,
          color: AppColors.clinicStatusWaiting,
        );
      case AppConstants.appointmentTypeFollowUp:
      default:
        return const _TypeStyle(
          labelKey: 'appointment_type.follow_up',
          icon: Icons.replay_rounded,
          color: AppColors.clinicTextSecondary,
        );
    }
  }
}

class _TypeStyle {
  const _TypeStyle({
    required this.labelKey,
    required this.icon,
    required this.color,
  });

  final String labelKey;
  final IconData icon;
  final Color color;
}
