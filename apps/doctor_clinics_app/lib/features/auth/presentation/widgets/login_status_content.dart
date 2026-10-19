import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_status_leading.dart';

/// Body of [LoginStatusBox]: the auth/DB status strip.
class LoginStatusContent extends StatelessWidget {
  const LoginStatusContent({
    super.key,
    required this.isChecking,
    required this.isSetup,
    required this.hasError,
  });

  final bool isChecking;
  final bool isSetup;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final message = isChecking
        ? 'login_status_checking'.tr()
        : isSetup
        ? 'login_status_setup'.tr()
        : hasError
        ? 'login_status_error'.tr()
        : 'login_status_ok'.tr();
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
                  LoginStatusLeading(
                    isChecking: isChecking,
                    isSetup: isSetup,
                    hasError: hasError,
                  ),
                  SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
                  Flexible(
                    child: ResponsiveText(
                      message,
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
