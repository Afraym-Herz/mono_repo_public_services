import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/home/presentation/widgets/home_alert_action_link.dart';

/// Info banner shown under the home greeting header.
///
/// Surfaces today's "no-show" count and links to the queue, where the late
/// patients are followed up. The count is still part of the translation string —
/// it will come from the appointments feed once that feature lands.
class HomeAppointmentsAlert extends StatelessWidget {
  const HomeAppointmentsAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 80),
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_LARGE.w,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_LARGE.w,
            vertical: Dimensions.PADDING_SIZE_SMALL.h,
          ),
          decoration: BoxDecoration(
            color: context.clinicIsDark
                ? AppColors.clinicSurfaceContainerDark
                : AppColors.clinicSurfaceContainer,
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                size: Dimensions.ICON_SIZE_SMALL.r,
                color: AppColors.info,
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
              Expanded(
                child: ResponsiveText(
                  'home_appointments_alert'.tr(),
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  fontWeight: FontWeight.w500,
                  color: context.clinicTextPrimary,
                ),
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
              const HomeAlertActionLink(),
            ],
          ),
        ),
      ),
    );
  }
}
