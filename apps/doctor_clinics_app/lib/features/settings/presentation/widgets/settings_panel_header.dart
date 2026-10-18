import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// Title bar for the quick-settings panel, with a close action.
class SettingsPanelHeader extends StatelessWidget {
  const SettingsPanelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_LARGE.w,
        vertical: Dimensions.PADDING_SIZE_SMALL.h,
      ),
      child: Row(
        children: [
          Icon(
            Icons.settings_rounded,
            size: Dimensions.ICON_SIZE_DEFAULT.r,
            color: context.clinicAccent,
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Expanded(
            child: ResponsiveText(
              'settings_title'.tr(),
              fontWeight: FontWeight.w700,
              color: context.clinicTextPrimary,
            ),
          ),
          Tooltip(
            message: 'settings_close'.tr(),
            child: IconButton(
              icon: const Icon(Icons.close_rounded),
              color: context.clinicTextSecondary,
              onPressed: () => context.pop(),
            ),
          ),
        ],
      ),
    );
  }
}
