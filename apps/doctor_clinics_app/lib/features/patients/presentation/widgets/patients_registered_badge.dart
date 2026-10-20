import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/patients_count_format.dart';

/// Tinted capsule beside the title showing the live registered-patient count.
class PatientsRegisteredBadge extends StatelessWidget {
  const PatientsRegisteredBadge({super.key, required this.count});

  /// Number of patients currently stored on the station.
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: context.clinicNavActiveBackground,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Dimensions.ICON_SIZE_VERY_SMALL.r,
            height: Dimensions.ICON_SIZE_VERY_SMALL.r,
            decoration: const BoxDecoration(
              color: AppColors.success,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
          ResponsiveText(
            'patients_header.registered'.tr(
              namedArgs: {'count': PatientsCountFormat.count(count, context)},
            ),
            fontSize: Dimensions.FONT_SIZE_SMALL,
            fontWeight: FontWeight.w600,
            color: context.clinicTextPrimary,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
