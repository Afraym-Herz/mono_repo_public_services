import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'appointment_count_badge.dart';
import 'appointment_header_title.dart';

/// Leading half of [AppointmentHeader]: heading plus today/week count pills.
///
/// Laid out with [Wrap] so the pills drop to a second line instead of
/// overflowing on narrow windows.
class AppointmentHeaderInfo extends StatelessWidget {
  const AppointmentHeaderInfo({
    super.key,
    required this.todayCount,
    required this.weekCount,
  });

  /// Appointments booked for today.
  final int todayCount;

  /// Appointments booked across the current calendar week.
  final int weekCount;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: Dimensions.PADDING_SIZE_SMALL.w,
      runSpacing: Dimensions.PADDING_SIZE_BORDER.h,
      children: [
        const AppointmentHeaderTitle(),
        AppointmentCountBadge(
          labelKey: 'appointment_header.today_count',
          count: todayCount,
        ),
        AppointmentCountBadge(
          labelKey: 'appointment_header.week_count',
          count: weekCount,
        ),
      ],
    );
  }
}
