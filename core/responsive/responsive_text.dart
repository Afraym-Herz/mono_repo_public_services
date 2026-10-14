import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'responsive_helper.dart';
import 'responsive_breakpoints.dart';

class ResponsiveText extends StatelessWidget {
  const ResponsiveText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.height,
    this.letterSpacing,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.fontFamily,
    this.responsive = true,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;
  final double? letterSpacing;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final String? fontFamily;
  final bool responsive;

  @override
  Widget build(BuildContext context) {
    final double responsiveFontSize = _getResponsiveFontSize(context);

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: responsive ? responsiveFontSize : fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
      ),
    );
  }

  double _getResponsiveFontSize(BuildContext context) {
    if (fontSize == null) return 14.sp;

    final deviceType = ResponsiveHelper.getDeviceType(context);
    final baseFontSize = fontSize!;

    switch (deviceType) {
      case AppDeviceType.mobileSmall:
        return (baseFontSize * 0.85).sp;
      case AppDeviceType.mobile:
        return baseFontSize.sp;
      case AppDeviceType.mobileLarge:
        return (baseFontSize * 1.1).sp;
      case AppDeviceType.tablet:
        return (baseFontSize * 1.15).sp;
      case AppDeviceType.tabletLarge:
        return (baseFontSize * 1.2).sp;
      case AppDeviceType.desktop:
        return (baseFontSize * 1.25).sp;
      case AppDeviceType.desktopLarge:
        return (baseFontSize * 1.3).sp;
      case AppDeviceType.desktopXL:
        return (baseFontSize * 1.4).sp;
    }
  }
}

// Text Styles Helper Class
class ResponsiveTextStyles {
  // Regular Text Styles
  static Widget regular(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    String? fontFamily,
    FontWeight? fontWeight,
  }) {
    return ResponsiveText(
      text,
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      height: height,
      fontFamily: fontFamily,
    );
  }

  // Medium Text Styles
  static Widget medium(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    String? fontFamily,
  }) {
    return ResponsiveText(
      text,
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.w500,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      height: height,
      fontFamily: fontFamily,
    );
  }

  // Bold Text Styles
  static Widget bold(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    String? fontFamily,
  }) {
    return ResponsiveText(
      text,
      fontSize: fontSize ?? 18,
      fontWeight: FontWeight.w700,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      height: height,
      fontFamily: fontFamily,
    );
  }

  // Title Text Styles
  static Widget title(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    String? fontFamily,
  }) {
    return ResponsiveText(
      text,
      fontSize: fontSize ?? 24,
      fontWeight: FontWeight.w600,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      height: height,
      fontFamily: fontFamily,
    );
  }

  // Heading Text Styles
  static Widget heading(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    String? fontFamily,
  }) {
    return ResponsiveText(
      text,
      fontSize: fontSize ?? 32,
      fontWeight: FontWeight.w800,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      height: height,
      fontFamily: fontFamily,
    );
  }

  // Caption Text Styles
  static Widget caption(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    String? fontFamily,
  }) {
    return ResponsiveText(
      text,
      fontSize: fontSize ?? 12,
      fontWeight: FontWeight.w400,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      height: height,
      fontFamily: fontFamily,
    );
  }
}
