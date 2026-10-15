import 'package:core/src/theme/dimensions.dart';
import 'package:flutter/material.dart';

import 'responsive_text.dart';

/// Convenience constructors over [ResponsiveText].
class ResponsiveTextStyles {
  static Widget _styled(
    String text, {
    required double defaultSize,
    required FontWeight weight,
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
      fontSize: fontSize ?? defaultSize,
      fontWeight: weight,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      height: height,
      fontFamily: fontFamily,
    );
  }

  static Widget regular(String text,
      {double? fontSize, Color? color, TextAlign? textAlign, int? maxLines,
      TextOverflow? overflow, double? height, String? fontFamily, FontWeight? fontWeight}) {
    return _styled(text, defaultSize: Dimensions.FONT_SIZE_DEFAULT, weight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize, color: color, textAlign: textAlign, maxLines: maxLines,
        overflow: overflow, height: height, fontFamily: fontFamily);
  }

  static Widget medium(String text,
      {double? fontSize, Color? color, TextAlign? textAlign, int? maxLines,
      TextOverflow? overflow, double? height, String? fontFamily}) {
    return _styled(text, defaultSize: Dimensions.FONT_SIZE_LARGE, weight: FontWeight.w500,
        fontSize: fontSize, color: color, textAlign: textAlign, maxLines: maxLines,
        overflow: overflow, height: height, fontFamily: fontFamily);
  }

  static Widget bold(String text,
      {double? fontSize, Color? color, TextAlign? textAlign, int? maxLines,
      TextOverflow? overflow, double? height, String? fontFamily}) {
    return _styled(text, defaultSize: Dimensions.FONT_SIZE_EXTRA_LARGE, weight: FontWeight.w700,
        fontSize: fontSize, color: color, textAlign: textAlign, maxLines: maxLines,
        overflow: overflow, height: height, fontFamily: fontFamily);
  }

  static Widget title(String text,
      {double? fontSize, Color? color, TextAlign? textAlign, int? maxLines,
      TextOverflow? overflow, double? height, String? fontFamily}) {
    return _styled(text, defaultSize: Dimensions.FONT_SIZE_OVER_LARGE, weight: FontWeight.w600,
        fontSize: fontSize, color: color, textAlign: textAlign, maxLines: maxLines,
        overflow: overflow, height: height, fontFamily: fontFamily);
  }

  static Widget heading(String text,
      {double? fontSize, Color? color, TextAlign? textAlign, int? maxLines,
      TextOverflow? overflow, double? height, String? fontFamily}) {
    return _styled(text, defaultSize: Dimensions.FONT_SIZE_EXTRA_OVER_LARGE, weight: FontWeight.w800,
        fontSize: fontSize, color: color, textAlign: textAlign, maxLines: maxLines,
        overflow: overflow, height: height, fontFamily: fontFamily);
  }

  static Widget caption(String text,
      {double? fontSize, Color? color, TextAlign? textAlign, int? maxLines,
      TextOverflow? overflow, double? height, String? fontFamily}) {
    return _styled(text, defaultSize: Dimensions.FONT_SIZE_SMALL, weight: FontWeight.w400,
        fontSize: fontSize, color: color, textAlign: textAlign, maxLines: maxLines,
        overflow: overflow, height: height, fontFamily: fontFamily);
  }
}
