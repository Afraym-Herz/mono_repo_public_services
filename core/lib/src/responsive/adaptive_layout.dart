// lib/core/responsive/adaptive_layout.dart

import 'package:core/src/responsive/design_sizes.dart';
import 'package:core/src/responsive/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'adaptive_layout_resolver.dart';

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
        // Prevent ScreenUtil explosion on 600-1400px widths: align the
        // design width with the real width so the scale factor stays ~1.0.
        final designSize =
            (constraints.maxWidth >= 600 && constraints.maxWidth < 1400)
            ? Size(constraints.maxWidth, baseDesignSize.height)
            : baseDesignSize;
        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => resolveAdaptiveLayout(
            context,
            deviceType,
            mobileSmallLayout: mobileSmallLayout,
            mobileLayout: mobileLayout,
            mobileLargeLayout: mobileLargeLayout,
            tabletLayout: tabletLayout,
            tabletLargeLayout: tabletLargeLayout,
            desktopLayout: desktopLayout,
            desktopLargeLayout: desktopLargeLayout,
            desktopXLLayout: desktopXLLayout,
          ),
        );
      },
    );
  }
}
