// lib/core/responsive/design_sizes.dart

import 'package:flutter/material.dart';
import 'responsive_breakpoints.dart';

class ResponsiveDesignSizes {
  // Mobile Design Sizes
  static const Size mobileSmall = Size(320, 568);
  static const Size mobile = Size(375, 812);
  static const Size mobileLarge = Size(414, 896);

  // Tablet Design Sizes
  static const Size tablet = Size(768, 1024);
  static const Size tabletLarge = Size(1024, 768);

  // Desktop Design Sizes
  static const Size desktop = Size(1440, 900);
  static const Size desktopLarge = Size(1920, 1080);
  static const Size desktopXL = Size(2560, 1440);

  // POS Specific Sizes
  static const Size posCompact = Size(1024, 600);
  static const Size posFull = Size(1280, 800);
  static const Size posWide = Size(1600, 900);

  // Get design size by device type
  static Size getDesignSize(AppDeviceType deviceType) {
    switch (deviceType) {
      case AppDeviceType.mobileSmall:
        return mobileSmall;
      case AppDeviceType.mobile:
        return mobile;
      case AppDeviceType.mobileLarge:
        return mobileLarge;
      case AppDeviceType.tablet:
        return tablet;
      case AppDeviceType.tabletLarge:
        return tabletLarge;
      case AppDeviceType.desktop:
        return desktop;
      case AppDeviceType.desktopLarge:
        return desktopLarge;
      case AppDeviceType.desktopXL:
        return desktopXL;
    }
  }
}
