import 'package:flutter/widgets.dart';

import 'fallback_layout_widget.dart';
import 'responsive_breakpoints.dart';

/// Picks the layout for [deviceType] from the [AdaptiveLayout] builders
/// (see `adaptive_layout.dart`), falling back to neighbours then
/// [FallbackLayoutWidget].
Widget resolveAdaptiveLayout(
  BuildContext context,
  AppDeviceType deviceType, {
  WidgetBuilder? mobileSmallLayout,
  WidgetBuilder? mobileLayout,
  WidgetBuilder? mobileLargeLayout,
  WidgetBuilder? tabletLayout,
  WidgetBuilder? tabletLargeLayout,
  WidgetBuilder? desktopLayout,
  WidgetBuilder? desktopLargeLayout,
  WidgetBuilder? desktopXLLayout,
}) {
  switch (deviceType) {
    case AppDeviceType.mobileSmall:
      return mobileSmallLayout?.call(context) ??
          mobileLayout?.call(context) ??
          const FallbackLayoutWidget();
    case AppDeviceType.mobile:
      return mobileLayout?.call(context) ??
          mobileSmallLayout?.call(context) ??
          const FallbackLayoutWidget();
    case AppDeviceType.mobileLarge:
      return mobileLargeLayout?.call(context) ??
          mobileLayout?.call(context) ??
          const FallbackLayoutWidget();
    case AppDeviceType.tablet:
      return tabletLayout?.call(context) ??
          mobileLargeLayout?.call(context) ??
          mobileLayout?.call(context) ??
          const FallbackLayoutWidget();
    case AppDeviceType.tabletLarge:
      return tabletLargeLayout?.call(context) ??
          desktopLayout?.call(context) ??
          tabletLayout?.call(context) ??
          mobileLargeLayout?.call(context) ??
          mobileLayout?.call(context) ??
          const FallbackLayoutWidget();
    case AppDeviceType.desktop:
      return desktopLayout?.call(context) ??
          tabletLargeLayout?.call(context) ??
          const FallbackLayoutWidget();
    case AppDeviceType.desktopLarge:
      return desktopLargeLayout?.call(context) ??
          desktopLayout?.call(context) ??
          const FallbackLayoutWidget();
    case AppDeviceType.desktopXL:
      return desktopXLLayout?.call(context) ??
          desktopLargeLayout?.call(context) ??
          desktopLayout?.call(context) ??
          const FallbackLayoutWidget();
  }
}
