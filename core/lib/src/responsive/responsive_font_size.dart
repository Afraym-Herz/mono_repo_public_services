import 'package:core/src/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'responsive_breakpoints.dart';
import 'responsive_helper.dart';

/// Resolves [fontSize] into a device-aware scaled value.
double resolveResponsiveFontSize(BuildContext context, double? fontSize) {
  if (fontSize == null) return Dimensions.FONT_SIZE_DEFAULT.sp;
  final double scale;
  switch (ResponsiveHelper.getDeviceType(context)) {
    case AppDeviceType.mobileSmall:
      scale = 0.85;
    case AppDeviceType.mobile:
      scale = 1.0;
    case AppDeviceType.mobileLarge:
      scale = 1.1;
    case AppDeviceType.tablet:
      scale = 1.15;
    case AppDeviceType.tabletLarge:
      scale = 1.2;
    case AppDeviceType.desktop:
      scale = 1.25;
    case AppDeviceType.desktopLarge:
      scale = 1.3;
    case AppDeviceType.desktopXL:
      scale = 1.4;
  }
  return (fontSize * scale).sp;
}
