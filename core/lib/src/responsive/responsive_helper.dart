// lib/core/responsive/responsive_helper.dart

import 'package:flutter/material.dart';
import 'responsive_breakpoints.dart';

class ResponsiveHelper {
  // Get Device Type
  static AppDeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < ResponsiveBreakpoints.mobileSmall) {
      return AppDeviceType.mobileSmall;
    } else if (width < ResponsiveBreakpoints.mobile) {
      return AppDeviceType.mobile;
    } else if (width < ResponsiveBreakpoints.mobileLarge) {
      return AppDeviceType.mobileLarge;
    } else if (width < ResponsiveBreakpoints.tablet) {
      return AppDeviceType.tablet;
    } else if (width < ResponsiveBreakpoints.tabletLarge) {
      return AppDeviceType.tabletLarge;
    } else if (width < ResponsiveBreakpoints.desktop) {
      return AppDeviceType.desktop;
    } else if (width < ResponsiveBreakpoints.desktopLarge) {
      return AppDeviceType.desktopLarge;
    } else {
      return AppDeviceType.desktopXL;
    }
  }

  static int getGridColumns(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < ResponsiveBreakpoints.mobile) {
      return 2; // Mobile: 2 columns
    } else if (width < ResponsiveBreakpoints.mobileLarge) {
      return 2; // Large Mobile: 2 columns
    } else if (width < ResponsiveBreakpoints.tablet) {
      return 3; // Small Tablet: 3 columns
    } else if (width < ResponsiveBreakpoints.tabletLarge) {
      return 3; // Tablet: 3 columns (بدلاً من 4)
    } else if (width < ResponsiveBreakpoints.desktop) {
      return 4; // Large Tablet: 4 columns
    } else if (width < ResponsiveBreakpoints.desktopLarge) {
      return 4; // Desktop: 4 columns (بدلاً من 6)
    } else {
      return 5; // Large Desktop: 5 columns (بدلاً من 8)
    }
  }

  // تحسين Screen Padding
  static EdgeInsets getScreenPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < ResponsiveBreakpoints.mobile) {
      return const EdgeInsets.all(8.0); // قليل للموبايل
    } else if (width < ResponsiveBreakpoints.mobileLarge) {
      return const EdgeInsets.all(12.0);
    } else if (width < ResponsiveBreakpoints.tablet) {
      return const EdgeInsets.all(16.0);
    } else if (width < ResponsiveBreakpoints.desktop) {
      return const EdgeInsets.all(20.0); // تقليل من 24
    } else {
      return const EdgeInsets.all(24.0); // تقليل من 32+
    }
  }

  // Get Screen Orientation
  static AppScreenOrientation getOrientation(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? AppScreenOrientation.portrait
        : AppScreenOrientation.landscape;
  }

  // Device Type Checks
  static bool isMobile(BuildContext context) {
    final deviceType = getDeviceType(context);
    return [
      AppDeviceType.mobileSmall,
      AppDeviceType.mobile,
      AppDeviceType.mobileLarge,
    ].contains(deviceType);
  }

  static bool isTablet(BuildContext context) {
    final deviceType = getDeviceType(context);
    return [
      AppDeviceType.tablet,
      AppDeviceType.tabletLarge,
    ].contains(deviceType);
  }

  static bool isDesktop(BuildContext context) {
    final deviceType = getDeviceType(context);
    return [
      AppDeviceType.desktop,
      AppDeviceType.desktopLarge,
      AppDeviceType.desktopXL,
    ].contains(deviceType);
  }

  // POS Specific Checks
  static PosLayoutMode getPosLayoutMode(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= ResponsiveBreakpoints.posWide) {
      return PosLayoutMode.wide;
    } else if (width >= ResponsiveBreakpoints.posFull) {
      return PosLayoutMode.full;
    } else {
      return PosLayoutMode.compact;
    }
  }

  static bool isPosCompactMode(BuildContext context) {
    return getPosLayoutMode(context) == PosLayoutMode.compact;
  }

  static bool isPosFullMode(BuildContext context) {
    return getPosLayoutMode(context) == PosLayoutMode.full;
  }

  static bool isPosWideMode(BuildContext context) {
    return getPosLayoutMode(context) == PosLayoutMode.wide;
  }

  static double getContentMaxWidth(BuildContext context) {
    final deviceType = getDeviceType(context);

    switch (deviceType) {
      case AppDeviceType.mobileSmall:
      case AppDeviceType.mobile:
      case AppDeviceType.mobileLarge:
        return double.infinity;
      case AppDeviceType.tablet:
        return 768;
      case AppDeviceType.tabletLarge:
        return 1024;
      case AppDeviceType.desktop:
        return 1200;
      case AppDeviceType.desktopLarge:
        return 1400;
      case AppDeviceType.desktopXL:
        return 1600;
    }
  }
}
