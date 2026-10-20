import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Retry surface shown when the register query fails.
class PatientsTableError extends StatelessWidget {
  const PatientsTableError({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r),
        border: Border.all(color: context.clinicBorder),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_LARGE.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                size: Dimensions.ICON_SIZE_EXTRA_LARGE.sp,
                color: AppColors.clinicError,
              ),
              SizedBox(height: Dimensions.paddingSizeDefault.h),
              ResponsiveText(
                'patients.table.load_error'.tr(),
                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                fontWeight: FontWeight.w700,
                color: context.clinicTextPrimary,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
              ResponsiveText(
                message,
                fontSize: Dimensions.FONT_SIZE_SMALL,
                color: context.clinicTextSecondary,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Dimensions.paddingSizeDefault.h),
              AppButton(
                label: 'patients.table.retry'.tr(),
                onPressed: onRetry,
                width: Dimensions.CONTROL_HEIGHT.w * 3,
                height: Dimensions.CONTROL_HEIGHT.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
