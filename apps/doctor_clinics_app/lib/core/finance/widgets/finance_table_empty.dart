import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Shared empty / no-match state rendered inside a billing table.
class FinanceTableEmpty extends StatelessWidget {
  const FinanceTableEmpty({
    super.key,
    required this.icon,
    required this.titleKey,
    required this.hintKey,
  });

  final IconData icon;
  final String titleKey;
  final String hintKey;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: Dimensions.ICON_SIZE_EXTRA_LARGE.r,
              color: context.clinicTextSecondary.withValues(alpha: 0.6),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
            ResponsiveText(
              titleKey.tr(),
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
              fontWeight: FontWeight.w700,
              color: context.clinicTextPrimary,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
            ResponsiveText(
              hintKey.tr(),
              fontSize: Dimensions.FONT_SIZE_SMALL,
              color: context.clinicTextSecondary,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
