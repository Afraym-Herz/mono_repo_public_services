import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QueueListError extends StatelessWidget {
  const QueueListError({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_LARGE.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: Dimensions.ICON_SIZE_EXTRA_LARGE.sp,
              color: AppColors.clinicError,
            ),
            SizedBox(height: Dimensions.paddingSizeDefault.h),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.clinicTextPrimary,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Dimensions.paddingSizeDefault.h),
            AppButton(
              label: 'queue_toolbar.refresh'.tr(),
              onPressed: onRetry,
              width: Dimensions.LOGIN_PANEL_MAX_WIDTH.w * 0.4,
              height: Dimensions.CONTROL_HEIGHT.h,
            ),
          ],
        ),
      ),
    );
  }
}
