import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Version pill pinned at the bottom of the side navigation bar.
class SideNavVersionBadge extends StatelessWidget {
  const SideNavVersionBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 200),
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.r),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.PADDING_SIZE_SMALL.h,
          ),
          decoration: BoxDecoration(
            color: context.clinicContainer,
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
          ),
          child: ResponsiveText(
            'nav_version'.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: context.clinicTextSecondary,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
