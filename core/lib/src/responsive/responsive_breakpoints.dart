// lib/core/responsive/responsive_breakpoints.dart

// lib/core/responsive/responsive_breakpoints.dart

class ResponsiveBreakpoints {
  // Basic Breakpoints - محسنة للـ POS
  static const double mobileSmall = 320;
  static const double mobile = 600; // زيادة من 480
  static const double mobileLarge = 900; // زيادة من 600
  static const double tablet = 1200; // زيادة من 768
  static const double tabletLarge = 1400; // زيادة من 1024
  static const double desktop = 1600; // زيادة من 1200
  static const double desktopLarge = 1920;
  static const double desktopXL = 2560;

  // POS Specific Breakpoints
  static const double posCompact = 1200; // زيادة من 900
  static const double posFull = 1600; // زيادة من 1280
  static const double posWide = 2000; // زيادة من 1600
}

// Device Types - مختلف عن ScreenUtil
enum AppDeviceType {
  mobileSmall,
  mobile,
  mobileLarge,
  tablet,
  tabletLarge,
  desktop,
  desktopLarge,
  desktopXL,
}

// Screen Orientation
enum AppScreenOrientation { portrait, landscape }

// POS Layout Modes
enum PosLayoutMode { compact, full, wide }
