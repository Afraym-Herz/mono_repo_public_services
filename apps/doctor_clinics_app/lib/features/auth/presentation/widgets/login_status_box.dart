import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Offline status strip (MVP-OFFLINE: local DB readiness, never cloud).
class LoginStatusBox extends StatelessWidget {
  const LoginStatusBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      duration: const Duration(milliseconds: 400),
      delay: const Duration(milliseconds: 400),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_SMALL.w,
          vertical: Dimensions.PADDING_SIZE_SMALL.h,
        ),
        decoration: BoxDecoration(
          color: context.clinicContainer,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
          border: Border.all(color: context.clinicBorder),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: Dimensions.NAVBAR_ICON_SIZE.r,
                    color: AppColors.successDark,
                  ),
                  SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
                  Flexible(
                    child: ResponsiveText(
                      'login_status_ok'.tr(),
                      fontSize: Dimensions.FONT_SIZE_SMALL,
                      fontWeight: FontWeight.w600,
                      color: context.clinicTextPrimary,
                    ),
                  ),
                ],
              ),
            ),
            ResponsiveText(
              'login_status_mode'.tr(),
              fontSize: Dimensions.FONT_SIZE_SMALL,
              color: context.clinicTextSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
