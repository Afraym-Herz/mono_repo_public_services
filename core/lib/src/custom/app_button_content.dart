import 'package:core/src/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Loading spinner / label+icon content for [AppButton].
class AppButtonContent extends StatelessWidget {
  const AppButtonContent({
    super.key,
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
        width: Dimensions.ICON_SIZE_DEFAULT.r,
        height: Dimensions.ICON_SIZE_DEFAULT.r,
        child: CircularProgressIndicator(strokeWidth: 2, color: color),
      );
    }
    final textWidget = Text(
      label,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: _textStyle,
    );
    if (icon == null) return textWidget;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: iconSize ?? Dimensions.NAVBAR_ICON_SIZE.r, color: color),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
        Flexible(child: textWidget),
      ],
    );
  }

  TextStyle get _textStyle => TextStyle(
        fontSize: fontSize ?? Dimensions.FONT_SIZE_DEFAULT.sp,
        fontWeight: FontWeight.w500,
        color: color,
      );
}
