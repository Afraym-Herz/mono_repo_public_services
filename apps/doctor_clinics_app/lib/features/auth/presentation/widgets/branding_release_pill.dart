import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/widgets/branding_pulsing_dot.dart';

/// White pill on the trailing side announcing the downloadable release.
class BrandingReleasePill extends StatelessWidget {
  const BrandingReleasePill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
      ),
      decoration: BoxDecoration(
        color: context.clinicIsDark ? context.clinicContainer : AppColors.white,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
        border: Border.all(color: context.clinicBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BrandingPulsingDot(),
          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
          ResponsiveText(
            'branding_release_pill'.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL - 1,
            fontWeight: FontWeight.w600,
            color: context.clinicTextSecondary,
          ),
        ],
      ),
    );
  }
}
