import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_calendar.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/appointment_date_label.dart';

import 'appointment_header_actions.dart';
import 'appointment_period_nav.dart';
import 'appointment_view_switcher.dart';

/// Second row of [AppointmentHeader]: switcher, date navigator and actions.
/// Wide windows spread the groups on one row; narrow windows wrap them.
class AppointmentHeaderControls extends StatelessWidget {
  const AppointmentHeaderControls({
    super.key,
    required this.mode,
    required this.anchorDate,
    required this.onModeChanged,
    required this.onPrevious,
    required this.onNext,
    required this.onToday,
    this.onBook,
    this.onPrint,
  });

  final AppointmentViewMode mode;
  final DateTime anchorDate;
  final ValueChanged<AppointmentViewMode> onModeChanged;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onToday;
  final VoidCallback? onBook;
  final VoidCallback? onPrint;

  @override
  Widget build(BuildContext context) {
    final switcher = AppointmentViewSwitcher(
      mode: mode,
      onChanged: onModeChanged,
    );
    final navigator = AppointmentPeriodNav(
      label: AppointmentDateLabel.of(
        mode,
        anchorDate,
        context.locale.toString(),
      ),
      onPrevious: onPrevious,
      onNext: onNext,
      onToday: onToday,
    );
    final actions = AppointmentHeaderActions(onBook: onBook, onPrint: onPrint);

    if (context.isMobileOrSmallTablet) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: Dimensions.PADDING_SIZE_SMALL.w,
            runSpacing: Dimensions.PADDING_SIZE_SMALL.h,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [switcher, navigator],
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          actions,
        ],
      );
    }

    return Row(
      children: [
        switcher,
        SizedBox(width: Dimensions.PADDING_SIZE_LARGE.w),
        Expanded(
          child: Align(alignment: Alignment.center, child: navigator),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_LARGE.w),
        actions,
      ],
    );
  }
}
