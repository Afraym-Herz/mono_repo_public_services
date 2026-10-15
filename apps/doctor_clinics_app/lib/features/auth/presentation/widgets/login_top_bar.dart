import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Login panel header: system name (start) + locale/theme toggles (end).
class LoginTopBar extends StatelessWidget {
  const LoginTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 400),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified_user_outlined,
                  size: Dimensions.ICON_SIZE_SMALL.r,
                  color: context.clinicAccent,
                ),
                SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
                Flexible(
                  child: Text(
                    'login_system_name'.tr(),
                    style: TextStyle(
                      fontSize: Dimensions.FONT_SIZE_SMALL.sp,
                      fontWeight: FontWeight.w600,
                      color: context.clinicAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const LanguageToggleButton(),
          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
          const ThemeToggleButton(),
        ],
      ),
    );
  }
}
