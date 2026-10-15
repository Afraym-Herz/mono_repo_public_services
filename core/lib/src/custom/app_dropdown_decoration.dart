import 'package:core/src/theme/app_colors.dart';
import 'package:core/src/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Builds the shared [InputDecoration] used by [AppDropdownField].
InputDecoration buildAppDropdownDecoration({
  required String label,
  required String? hint,
  required IconData? prefixIcon,
  required Color fillColor,
  required bool enabled,
  required OutlineInputBorder enabledBorder,
  required Color primary,
  required ColorScheme scheme,
  required bool isDark,
}) {
  OutlineInputBorder border(Color color, [double width = 1]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  return InputDecoration(
    labelText: label,
    hintText: hint,
    filled: true,
    fillColor: enabled ? fillColor : fillColor.withValues(alpha: 0.5),
    labelStyle: TextStyle(
      fontSize: Dimensions.FONT_SIZE_DEFAULT.sp,
      color: AppColors.textTertiary,
    ),
    hintStyle: TextStyle(
      fontSize: Dimensions.FONT_SIZE_DEFAULT.sp,
      color: AppColors.textTertiary,
    ),
    floatingLabelStyle: TextStyle(
      fontSize: Dimensions.FONT_SIZE_SMALL.sp,
      color: primary,
      fontWeight: FontWeight.w500,
    ),
    prefixIcon: prefixIcon != null
        ? Icon(prefixIcon, size: Dimensions.NAVBAR_ICON_SIZE.r, color: primary)
        : null,
    contentPadding: EdgeInsets.symmetric(
      horizontal: Dimensions.paddingSizeDefault.w,
      vertical: Dimensions.paddingSizeDefault.h,
    ),
    border: enabledBorder,
    enabledBorder: enabledBorder,
    focusedBorder: border(primary, 1.5),
    errorBorder: border(scheme.error),
    focusedErrorBorder: border(scheme.error, 1.5),
    disabledBorder: border(
      isDark ? AppColors.borderDark : AppColors.borderPrimary.withValues(alpha: 0.5),
    ),
  );
}
