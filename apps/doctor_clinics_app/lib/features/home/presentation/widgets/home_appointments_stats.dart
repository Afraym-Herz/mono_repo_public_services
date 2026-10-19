import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_appointments_count.dart';

/// Two-counter summary: tomorrow's booked total and the unconfirmed cases.
class HomeAppointmentsStats extends StatelessWidget {
  const HomeAppointmentsStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: HomeAppointmentsCount(
            icon: Icons.groups_2_outlined,
            label: 'home_appointments_total'.tr(),
            color: context.clinicTextSecondary,
          ),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
        Expanded(
          child: HomeAppointmentsCount(
            icon: Icons.error_outline_rounded,
            label: 'home_appointments_unconfirmed'.tr(),
            color: AppColors.warningDark,
          ),
        ),
      ],
    );
  }
}
