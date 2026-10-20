import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'patient_empty_value.dart';

/// Pill showing the stored blood type (`A+`, `O-`), or an em dash when unknown.
class PatientBloodBadge extends StatelessWidget {
  const PatientBloodBadge({super.key, required this.bloodType});

  final String? bloodType;

  @override
  Widget build(BuildContext context) {
    final value = bloodType?.trim();
    if (value == null || value.isEmpty) {
      return const PatientEmptyValue();
    }
    final foreground = context.clinicIsDark
        ? AppColors.clinicInversePrimary
        : context.clinicPrimary;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: context.clinicNavActiveBackground,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
      ),
      child: ResponsiveText(
        value,
        fontSize: Dimensions.FONT_SIZE_SMALL,
        fontWeight: FontWeight.w700,
        color: foreground,
        maxLines: 1,
      ),
    );
  }
}
