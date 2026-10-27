import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Load failure with a retry action.
class FinanceErrorState extends StatelessWidget {
  const FinanceErrorState({
    super.key,
    required this.messageKey,
    required this.onRetry,
  });

  final String messageKey;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: Dimensions.ICON_SIZE_EXTRA_LARGE.r,
              color: context.clinicActionDanger,
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
            ResponsiveText(
              'billing.error.title'.tr(),
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
              fontWeight: FontWeight.w700,
              color: context.clinicTextPrimary,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
            ResponsiveText(
              messageKey.tr(),
              fontSize: Dimensions.FONT_SIZE_SMALL,
              color: context.clinicTextSecondary,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
            AppPillButton(
              icon: Icons.refresh_rounded,
              label: 'billing.error.retry'.tr(),
              onTap: onRetry,
              primary: true,
            ),
          ],
        ),
      ),
    );
  }
}
