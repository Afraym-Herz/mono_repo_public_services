import 'package:core/src/theme/app_colors.dart';
import 'package:core/src/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_button_content.dart';

/// A branded action button used throughout the app with unified solid primary color.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.width = double.infinity,
    this.height,
    this.icon,
    this.outlined = false,
    this.color,
    this.textColor,
    this.borderColor,
    this.fontSize,
    this.iconSize,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double? height;
  final IconData? icon;
  final bool outlined;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? fontSize;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final primary = color ?? Theme.of(context).primaryColor;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final fg = outlined ? (textColor ?? primary) : AppColors.white;
    final bg = outlined
        ? AppColors.transparent
        : (isLoading ? primary.withValues(alpha: 0.55) : primary);
    final border = outlined
        ? (borderColor ?? (isDark
              ? AppColors.disabledBorderDark
              : AppColors.disabledBorderLight))
        : AppColors.transparent;
    return SizedBox(
      width: width,
      height: height ?? Dimensions.HEIGHT_WIDTH_50.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          disabledBackgroundColor: bg,
          foregroundColor: fg,
          disabledForegroundColor: fg,
          elevation: (outlined || isLoading) ? 0 : 4,
          shadowColor: primary.withValues(alpha: 0.35),
          side: outlined ? BorderSide(color: border, width: 1.5) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
          ),
        ),
        child: AppButtonContent(
          label: label,
          isLoading: isLoading,
          icon: icon,
          color: fg,
          fontSize: fontSize,
          iconSize: iconSize,
        ),
      ),
    );
  }
}
