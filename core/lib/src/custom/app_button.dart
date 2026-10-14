import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final fg = outlined ? (textColor ?? primary) : Colors.white;
    final bg = outlined
        ? Colors.transparent
        : (isLoading ? primary.withValues(alpha: 0.55) : primary);
    final border = outlined
        ? (borderColor ??
              (isDark ? const Color(0xFF4B5563) : const Color(0xFFCBD5E1)))
        : Colors.transparent;

    return SizedBox(
      width: width,
      height: height ?? 52.h,
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
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: _AppButtonContent(
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

class _AppButtonContent extends StatelessWidget {
  const _AppButtonContent({
    required this.label,
    required this.isLoading,
    required this.icon,
    required this.color,
    this.fontSize,
    this.iconSize,
  });

  final String label;
  final bool isLoading;
  final IconData? icon;
  final Color color;
  final double? fontSize;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: 22.r,
        height: 22.r,
        child: CircularProgressIndicator(strokeWidth: 2, color: color),
      );
    }
    final textWidget = Text(
      label,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize ?? 14.sp,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
    if (icon == null) return textWidget;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: iconSize ?? 20.r, color: color),
        SizedBox(width: 8.w),
        Flexible(child: textWidget),
      ],
    );
  }
}
