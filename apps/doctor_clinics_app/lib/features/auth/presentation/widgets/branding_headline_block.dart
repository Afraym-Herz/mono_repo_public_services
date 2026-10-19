import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Eyebrow badge + headline + supporting paragraph, start-aligned.
class BrandingHeadlineBlock extends StatelessWidget {
  const BrandingHeadlineBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_SMALL.w,
              vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
            ),
            decoration: BoxDecoration(
              color: context.clinicAccent.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.palette_outlined,
                  size: Dimensions.ICON_SIZE_EXTRA_SMALL.r,
                  color: context.clinicPrimary,
                ),
                SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
                ResponsiveText(
                  'branding_eyebrow'.tr(),
                  fontSize: Dimensions.FONT_SIZE_SMALL - 1,
                  fontWeight: FontWeight.w600,
                  color: context.clinicPrimary,
                ),
              ],
            ),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
          ResponsiveText(
            'branding_headline'.tr(),
            fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
            fontWeight: FontWeight.w800,
            height: 1.35,
            color: context.clinicTextPrimary,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
          ResponsiveText(
            'branding_body'.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL - 1,
            height: 1.6,
            color: context.clinicTextSecondary,
          ),
        ],
      ),
    );
  }
}
