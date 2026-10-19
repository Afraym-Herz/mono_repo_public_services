import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_section_card.dart';

/// Card shell reserving space for the dashboard sections still to be built.
class HomePlaceholder extends StatelessWidget {
  const HomePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeSectionCard(
      animationDelay: const Duration(milliseconds: 620),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.dashboard_outlined,
            size: Dimensions.ICON_SIZE_LARGE.r,
            color: context.clinicAccent,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
          ResponsiveText(
            'home'.tr(),
            fontSize: Dimensions.FONT_SIZE_DEFAULT,
            fontWeight: FontWeight.w700,
            color: context.clinicTextPrimary,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h / 2),
          ResponsiveText(
            'home_placeholder'.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: context.clinicTextSecondary,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
