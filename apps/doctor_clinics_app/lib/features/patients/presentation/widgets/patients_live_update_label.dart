import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Muted "live medical-file updates" note trailing the registered badge.
class PatientsLiveUpdateLabel extends StatelessWidget {
  const PatientsLiveUpdateLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ResponsiveText(
          '•',
          fontSize: Dimensions.FONT_SIZE_SMALL,
          color: context.clinicTextSecondary,
          responsive: false,
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
        Flexible(
          child: ResponsiveText(
            'patients_header.live_update'.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: context.clinicTextSecondary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
