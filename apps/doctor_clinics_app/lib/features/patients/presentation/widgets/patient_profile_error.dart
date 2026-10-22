import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Failure state for the patient profile modal, with a retry action.
class PatientProfileError extends StatelessWidget {
  const PatientProfileError({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_LARGE.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: Dimensions.ICON_SIZE_EXTRA_LARGE.r,
            color: context.clinicTextSecondary,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          ResponsiveText(
            'patient_profile.load_error'.tr(),
            color: context.clinicTextSecondary,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
          AppButton(
            label: 'patient_profile.retry'.tr(),
            icon: Icons.refresh_rounded,
            height: Dimensions.CONTROL_HEIGHT.h,
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
