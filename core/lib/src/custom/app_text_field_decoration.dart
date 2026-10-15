import 'package:core/src/theme/app_colors.dart';
import 'package:core/src/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Focus glow shown under the field in light mode while focused.
List<BoxShadow> buildTextFieldFocusShadow({
  required bool isDark,
  required bool isFocused,
  required Color primary,
}) {
  if (isDark || !isFocused) return const <BoxShadow>[];
  return [
    BoxShadow(
      color: primary.withValues(alpha: 0.18),
      blurRadius: 10,
      offset: const Offset(0, 3),
    ),
  ];
}

/// Builds the shared [InputDecoration] used by [AppTextField].
InputDecoration buildAppTextFieldDecoration({
  required String? label,
  required String? hint,
  required IconData? prefixIcon,
  required Color iconColor,
  required Widget? suffixIcon,
  required Color fillColor,
  required bool enabled,
  required Color enabledBorderColor,
  required Color primary,
  required Color errorColor,
  required BorderRadius radius,
}) {
  OutlineInputBorder border(Color color, [double width = 1]) {
    return OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: color, width: width),
    );
  }

  return InputDecoration(
    labelText: (label != null && label.isNotEmpty) ? label : null,
    hintText: hint,
    prefixIcon: prefixIcon != null
        ? AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_SMALL.w,
            ),
            child: Icon(
              prefixIcon,
              size: Dimensions.NAVBAR_ICON_SIZE.r,
              color: iconColor,
            ),
          )
        : null,
    prefixIconConstraints: BoxConstraints(minWidth: 44.w, minHeight: 0),
    suffixIcon: suffixIcon,
    filled: true,
    fillColor: enabled ? fillColor : fillColor.withValues(alpha: 0.5),
    contentPadding: EdgeInsets.symmetric(
      horizontal: Dimensions.paddingSizeDefault.w,
      vertical: Dimensions.paddingSizeDefault.h,
    ),
    border: border(enabledBorderColor),
    enabledBorder: border(enabledBorderColor),
    focusedBorder: border(primary, 1.8),
    errorBorder: border(errorColor),
    focusedErrorBorder: border(errorColor, 1.8),
    disabledBorder: border(enabledBorderColor.withValues(alpha: 0.4)),
    labelStyle: TextStyle(
      fontSize: Dimensions.FONT_SIZE_SMALL.sp,
      color: AppColors.textTertiary,
      fontWeight: FontWeight.w400,
    ),
    floatingLabelStyle: TextStyle(
      fontSize: Dimensions.FONT_SIZE_SMALL.sp,
      color: primary,
      fontWeight: FontWeight.w600,
    ),
    hintStyle: TextStyle(
      fontSize: Dimensions.FONT_SIZE_SMALL.sp,
      color: AppColors.textTertiary,
    ),
    errorStyle: TextStyle(
      fontSize: Dimensions.NAVBAR_FONT_SIZE.sp,
      color: errorColor,
    ),
  );
}
