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
          Text(
            'login_title'.tr(),
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.FONT_SIZE_OVER_OVER_LARGE.sp,
              fontWeight: FontWeight.w700,
              color: context.clinicTextPrimary,
            ),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
          Text(
            'login_subtitle'.tr(),
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.FONT_SIZE_DEFAULT.sp,
              color: context.clinicTextSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
