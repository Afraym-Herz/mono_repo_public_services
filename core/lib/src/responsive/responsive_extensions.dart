// lib/core/responsive/responsive_extensions.dart

import 'package:flutter/material.dart';
import 'responsive_helper.dart';
import 'responsive_breakpoints.dart';

extension ResponsiveContext on BuildContext {
  // Device Type Checks
  bool get isMobile => ResponsiveHelper.isMobile(this);
  bool get isTablet => ResponsiveHelper.isTablet(this);
  bool get isDesktop => ResponsiveHelper.isDesktop(this);

  /// True for Mobile (< 600px) and Small Tablet (< 1200px).
  /// Used to branch navigation to full-screen route pushes (`context.push`) instead of desktop dialogs.
  bool get isMobileOrSmallTablet => screenWidth < ResponsiveBreakpoints.tablet;

  /// True for Large Tablet (>= 1200px) and Desktop (>= 1600px).
  /// Used to branch navigation to desktop modals (`transparentModalRoutePage`)
  /// and docked desktop shell layouts.
  bool get isLargeTabletOrDesktop =>
      screenWidth >= ResponsiveBreakpoints.tablet;

  // POS Mode Checks
  bool get isPosCompact => ResponsiveHelper.isPosCompactMode(this);
  bool get isPosFull => ResponsiveHelper.isPosFullMode(this);
  bool get isPosWide => ResponsiveHelper.isPosWideMode(this);

  // Screen Properties
  AppDeviceType get deviceType => ResponsiveHelper.getDeviceType(this);
  AppScreenOrientation get screenOrientation =>
      ResponsiveHelper.getOrientation(this);
  PosLayoutMode get posLayoutMode => ResponsiveHelper.getPosLayoutMode(this);

  // Layout Helpers
  EdgeInsets get screenPadding => ResponsiveHelper.getScreenPadding(this);
  int get gridColumns => ResponsiveHelper.getGridColumns(this);
  double get contentMaxWidth => ResponsiveHelper.getContentMaxWidth(this);

  // Screen Dimensions
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get safeAreaTop => MediaQuery.of(this).padding.top;
  double get safeAreaBottom => MediaQuery.of(this).padding.bottom;

  // Responsive Values
  T responsive<T>({T? mobile, T? tablet, T? desktop, required T defaultValue}) {
    if (isMobile && mobile != null) return mobile;
    if (isTablet && tablet != null) return tablet;
    if (isDesktop && desktop != null) return desktop;
    return defaultValue;
  }

  // POS Specific Responsive Values
  T posResponsive<T>({T? compact, T? full, T? wide, required T defaultValue}) {
    if (isPosCompact && compact != null) return compact;
    if (isPosFull && full != null) return full;
    if (isPosWide && wide != null) return wide;
    return defaultValue;
  }
}
