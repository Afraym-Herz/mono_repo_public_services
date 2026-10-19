import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/widgets/branding_footer_item.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/branding_upgrade_pill.dart';

/// Bottom row: availability (start), hotline (center), upgrade pill (end).
class BrandingFooter extends StatelessWidget {
  const BrandingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      delay: const Duration(milliseconds: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(height: 1.h, color: context.clinicBorder),
          SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
          Row(
            children: [
              Tooltip(
                message: 'branding_footer_availability_tip'.tr(),
                child: BrandingFooterItem(
                  icon: Icons.schedule,
                  text: 'branding_footer_availability'.tr(),
                  color: AppColors.clinicSecondary,
                ),
              ),
              const Spacer(),
              Tooltip(
                message: 'branding_footer_hotline_tip'.tr(),
                child: BrandingFooterItem(
                  icon: Icons.call_outlined,
                  text: 'branding_footer_hotline'.tr(),
                  color: context.clinicTextSecondary,
                ),
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
              const BrandingUpgradePill(),
            ],
          ),
        ],
      ),
    );
  }
}
