import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Clinic identity block pinned at the top of the side navigation bar.
class SideNavHeader extends StatelessWidget {
  const SideNavHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_LARGE.w,
        vertical: Dimensions.PADDING_SIZE_LARGE.h,
      ),
      child: Row(
        children: [
          Container(
            width: 40.r,
            height: 40.r,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.clinicNavActiveBackground,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.local_hospital_rounded,
              size: Dimensions.ICON_SIZE_DEFAULT.r,
              color: context.clinicAccent,
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveText(
                  'branding_clinic_name'.tr(),
                  fontWeight: FontWeight.w700,
                  color: context.clinicTextPrimary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                ResponsiveText(
                  'nav_clinic_specialty'.tr(),
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: context.clinicTextSecondary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
