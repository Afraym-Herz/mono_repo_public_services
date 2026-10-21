import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_calendar.dart';

import 'appointment_header_controls.dart';
import 'appointment_header_info.dart';

/// Appointment planner banner docked under the workspace top bar.
///
/// Row 1: the schedule heading with live "today" and "this week" count pills.
/// Row 2: Day/Week/Month switcher, date navigator and the print/book actions.
class AppointmentHeader extends StatelessWidget {
  const AppointmentHeader({
    super.key,
    required this.mode,
    required this.anchorDate,
    required this.todayCount,
    required this.weekCount,
    required this.onModeChanged,
    required this.onPrevious,
    required this.onNext,
    required this.onToday,
    this.onBook,
    this.onPrint,
  });

  final AppointmentViewMode mode;
  final DateTime anchorDate;
  final int todayCount;
  final int weekCount;
  final ValueChanged<AppointmentViewMode> onModeChanged;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onToday;
  final VoidCallback? onBook;
  final VoidCallback? onPrint;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_LARGE.w,
          vertical: Dimensions.PADDING_SIZE_LARGE.h,
        ),
        decoration: BoxDecoration(
          color: context.clinicIsDark
              ? AppColors.clinicBackgroundDark
              : AppColors.surfaceWhite,
          border: Border(bottom: BorderSide(color: context.clinicBorder)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppointmentHeaderInfo(todayCount: todayCount, weekCount: weekCount),
            SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
            AppointmentHeaderControls(
              mode: mode,
              anchorDate: anchorDate,
              onModeChanged: onModeChanged,
              onPrevious: onPrevious,
              onNext: onNext,
              onToday: onToday,
              onBook: onBook,
              onPrint: onPrint,
            ),
          ],
        ),
      ),
    );
  }
}
