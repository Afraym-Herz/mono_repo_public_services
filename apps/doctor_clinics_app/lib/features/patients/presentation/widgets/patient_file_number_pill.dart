import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Muted pill showing the patient's stored file number.
class PatientFileNumberPill extends StatelessWidget {
  const PatientFileNumberPill({super.key, required this.fileNumber});

  final String fileNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: context.clinicContainer,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
        border: Border.all(color: context.clinicBorder),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'patient_profile.file_number'.tr(),
              style: TextStyle(
                fontSize: Dimensions.FONT_SIZE_SMALL.sp,
                color: context.clinicTextSecondary,
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
            Text(
              fileNumber,
              style: TextStyle(
                fontSize: Dimensions.FONT_SIZE_DEFAULT.sp,
                fontWeight: FontWeight.w700,
                color: context.clinicPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
