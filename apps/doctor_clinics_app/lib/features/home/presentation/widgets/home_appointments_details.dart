import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_section_detail_row.dart';

/// Detail lines under the appointments highlight tile: tomorrow's booked total
/// and the cases still waiting on a confirmation.
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
          icon: Icons.notifications_active_outlined,
          label: 'home_appointments_unconfirmed'.tr(),
          color: AppColors.warningDark,
          emphasized: true,
        ),
      ],
    );
  }
}
