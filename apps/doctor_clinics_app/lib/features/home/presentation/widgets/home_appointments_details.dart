import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_section_detail_row.dart';

/// Detail lines under the appointments highlight tile: tomorrow's booked total
/// and the day-based queue-number hint.
class HomeAppointmentsDetails extends StatelessWidget {
  const HomeAppointmentsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HomeSectionDetailRow(
          icon: Icons.groups_2_outlined,
          label: 'home_appointments_total'.tr(),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h / 2),
        HomeSectionDetailRow(
          icon: Icons.format_list_numbered_rounded,
          label: 'home_appointments_booking_hint'.tr(),
        ),
      ],
    );
  }
}
