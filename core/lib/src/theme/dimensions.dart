// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:core/src/responsive/responsive_breakpoints.dart';
import 'package:core/src/routing/navigation_service.dart';

class Dimensions {
  static double get _width {
    final context = NavigationService.navigatorKey.currentContext;
    if (context != null && context.mounted) {
      return MediaQuery.sizeOf(context).width;
    }
    return 400;
  }

  /// Tablet threshold from [ResponsiveBreakpoints.tablet] (>= 1200).
  /// Font scale switches here via `ResponsiveContext` breakpoints.
  static bool get _isLarge => _width >= ResponsiveBreakpoints.tablet;

  static double get fontSizeExtraSmall => _isLarge ? 14 : 10;
  static double get fontSizeSmall => _isLarge ? 16 : 12;
  static double get fontSizeDefault => _isLarge ? 18 : 14;
  static double get fontSizeLarge => _isLarge ? 20 : 16;
  static double get fontSizeExtraLarge => _isLarge ? 22 : 18;
  static double get fontSizeOverLarge => _isLarge ? 28 : 24;

  static const double ICON_SIZE_VERY_SMALL = 8.0;
  static const double ICON_SIZE_EXTRA_SMALL = 12.0;
  static const double ICON_SIZE_SMALL = 18.0;
  static const double ICON_SIZE_DEFAULT = 24.0;
  static const double ICON_SIZE_LARGE = 32.0;
  static const double ICON_SIZE_EXTRA_LARGE = 40.0;

  static const double FONT_SIZE_EXTRA_SMALL = 8.0;
  static const double FONT_SIZE_SMALL = 12.0;
  static const double FONT_SIZE_DEFAULT = 14.0;
  static const double FONT_SIZE_LARGE = 16.0;
  static const double FONT_SIZE_EXTRA_LARGE = 20.0;
  static const double FONT_SIZE_OVER_LARGE = 20.0;
  static const double FONT_SIZE_EXTRA_OVER_LARGE = 22.0;
  static const double FONT_SIZE_OVER_OVER_LARGE = 28.0;

  static const double PADDING_SIZE_CARD = 1.0;
  static const double PADDING_SIZE_BORDER = 3.0;
  static const double PADDING_SIZE_MEDIUM_BORDER = 5.0;
  static const double PADDING_SIZE_EXTRA_SMALL = 8.0;
  static const double PADDING_SIZE_SMALL = 10.0;
  static const double paddingSizeDefault = 15.0;
  static const double PADDING_SIZE_LARGE = 20.0;
  static const double PADDING_SIZE_EXTRA_LARGE = 25.0;
  static const double HOME_PAGE_PADDING = 15.0;
  static const double PADDING_SIZE_EXTRA_EXTRA_LARGE = 30.0;

  static const double RADIUS_SMALL = 5.0;
  static const double RADIUS_DEFAULT = 10.0;
  static const double RADIUS_LARGE = 15.0;
  static const double RADIUS_EXTRA_LARGE = 20.0;

  static const double NAVBAR_ICON_SIZE = 20.0;
  static const double NAVBAR_FONT_SIZE = 10.0;

  static const double WEB_MAX_WIDTH = 1170;
  static const double DROPDOWN_WIDTH = 110.0;
  static const double DROPDOWN_HEIGHT = 35.0;

  static const double HEIGHT_WIDTH_50 = 50.0;

  // Content max-widths per device class (used by ResponsiveHelper).
  static const double CONTENT_MAX_TABLET = 768;
  static const double CONTENT_MAX_TABLET_LARGE = 1024;
  static const double CONTENT_MAX_DESKTOP = 1200;
  static const double CONTENT_MAX_DESKTOP_LARGE = 1400;
  static const double CONTENT_MAX_DESKTOP_XL = 1600;
}
