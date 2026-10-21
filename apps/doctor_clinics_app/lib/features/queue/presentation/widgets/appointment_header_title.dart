import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Heading of the appointments banner: teal calendar glyph + title.
class AppointmentHeaderTitle extends StatelessWidget {
  const AppointmentHeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.calendar_month_rounded,
          size: Dimensions.ICON_SIZE_DEFAULT.r,
          color: context.clinicAccent,
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
        ResponsiveText(
          'appointment_header.title'.tr(),
          fontSize: Dimensions.FONT_SIZE_LARGE,
          fontWeight: FontWeight.w700,
          color: context.clinicTextPrimary,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
