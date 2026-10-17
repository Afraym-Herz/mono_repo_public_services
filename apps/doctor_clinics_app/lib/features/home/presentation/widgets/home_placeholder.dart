import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Placeholder canvas for the home dashboard (built out later).
class HomePlaceholder extends StatelessWidget {
  const HomePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_LARGE.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.dashboard_outlined,
              size: Dimensions.ICON_SIZE_EXTRA_LARGE.r,
              color: context.clinicAccent,
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
            ResponsiveText(
              'home'.tr(),
              fontWeight: FontWeight.w700,
              color: context.clinicTextPrimary,
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
            ResponsiveText(
              'home_placeholder'.tr(),
              fontSize: Dimensions.FONT_SIZE_SMALL,
              color: context.clinicTextSecondary,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
