import 'package:core/src/theme/dimensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_button.dart';

/// Confirm/cancel buttons row for [CustomDialog] (see `logout_dialog.dart`).
class LogoutDialogActions extends StatelessWidget {
  const LogoutDialogActions({
    super.key,
    required this.onTapFalse,
    required this.onTapTrue,
    this.onTapTrueText,
    this.onTapFalseText,
    this.isInternetCheck,
  });

  final Function()? onTapFalse;
  final Function()? onTapTrue;
  final String? onTapTrueText;
  final String? onTapFalseText;
  final bool? isInternetCheck;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isInternetCheck == null || isInternetCheck == false)
          Expanded(
            child: AppButton(
              label: onTapFalseText ?? 'no'.tr(),
              // Secondary action: outlined, so it never
              // competes with the filled confirm button.
              outlined: true,
              height: Dimensions.HEIGHT_WIDTH_50.h,
              onPressed: onTapFalse,
            ),
          ),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        Expanded(
          child: AppButton(
            label: onTapTrueText ?? 'yes'.tr(),
            height: Dimensions.HEIGHT_WIDTH_50.h,
            onPressed: onTapTrue,
          ),
        ),
      ],
    );
  }
}
