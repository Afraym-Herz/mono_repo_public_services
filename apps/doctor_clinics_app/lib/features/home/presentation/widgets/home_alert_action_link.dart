import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// "View latecomers" shortcut on the home appointments alert.
///
/// `arrow_forward_rounded` is RTL-aware and mirrors itself, so it points left in
/// Arabic, matching the design.
class HomeAlertActionLink extends StatelessWidget {
  const HomeAlertActionLink({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      radius: Dimensions.RADIUS_DEFAULT.r,
      onTap: () => context.go(Routes.queue),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
          vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h / 2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ResponsiveText(
              'home_view_latecomers'.tr(),
              fontSize: Dimensions.FONT_SIZE_SMALL,
              fontWeight: FontWeight.w700,
              color: context.clinicAccent,
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
            Icon(
              Icons.arrow_forward_rounded,
              size: Dimensions.ICON_SIZE_SMALL.r,
              color: context.clinicAccent,
            ),
          ],
        ),
      ),
    );
  }
}
