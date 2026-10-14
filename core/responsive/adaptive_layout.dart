// lib/core/responsive/adaptive_layout.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:agreements/core/responsive/fallback_layout_widget.dart';
import 'design_sizes.dart';
import 'responsive_helper.dart';
import 'responsive_breakpoints.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    this.mobileSmallLayout,
    this.mobileLayout,
    this.mobileLargeLayout,
    this.tabletLayout,
    this.tabletLargeLayout,
    this.desktopLayout,
    this.desktopLargeLayout,
    this.desktopXLLayout,
  }) : assert(
         mobileLayout != null ||
             tabletLayout != null ||
             tabletLargeLayout != null ||
             desktopLayout != null,
         'At least one layout must be provided',
       );

  final WidgetBuilder? mobileSmallLayout;
  final WidgetBuilder? mobileLayout;
  final WidgetBuilder? mobileLargeLayout;
  final WidgetBuilder? tabletLayout;
  final WidgetBuilder? tabletLargeLayout;
  final WidgetBuilder? desktopLayout;
  final WidgetBuilder? desktopLargeLayout;
  final WidgetBuilder? desktopXLLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final deviceType = ResponsiveHelper.getDeviceType(context);
        final baseDesignSize = ResponsiveDesignSizes.getDesignSize(deviceType);

        // Prevent ScreenUtil font/dimension explosion when running on tablets and large mobile screens (600px -> 1400px).
        // By aligning designSize.width with constraints.maxWidth, scale factor stays ~1.0, preserving sleek typography.
        final designSize =
            (constraints.maxWidth >= 600 && constraints.maxWidth < 1400)
            ? Size(constraints.maxWidth, baseDesignSize.height)
            : baseDesignSize;

        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return _buildLayoutForDevice(context, deviceType);
          },
        );
      },
    );
  }

  Widget _buildLayoutForDevice(BuildContext context, AppDeviceType deviceType) {
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
}
