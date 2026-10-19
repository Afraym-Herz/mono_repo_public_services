import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// First-run headline + subtitle block (DESIGN headline-lg / body-sm).
class FirstRunHeader extends StatelessWidget {
  const FirstRunHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ResponsiveText(
          'login_first_run_title'.tr(),
          fontSize: Dimensions.FONT_SIZE_LARGE,
          fontWeight: FontWeight.w700,
          color: context.clinicTextPrimary,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
        ResponsiveText(
          'login_first_run_subtitle'.tr(),
          fontSize: Dimensions.FONT_SIZE_SMALL,
          color: context.clinicTextSecondary,
          textAlign: TextAlign.start,
          height: 1.6,
        ),
      ],
    );
  }
}
