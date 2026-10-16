import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Login headline block (DESIGN headline-xl 28 / body-lg).
class LoginTitleBlock extends StatelessWidget {
  const LoginTitleBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      delay: const Duration(milliseconds: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ResponsiveText(
            'login_title'.tr(),
            fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
            fontWeight: FontWeight.w700,
            color: context.clinicTextPrimary,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
          ResponsiveText(
            'login_subtitle'.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: context.clinicTextSecondary,
            textAlign: TextAlign.start,
            height: 1.6,
          ),
        ],
      ),
    );
  }
}
