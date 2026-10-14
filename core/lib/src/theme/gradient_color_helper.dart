import 'package:core/src/theme/theme_manager.dart';
import 'package:flutter/material.dart';

class GradientColorHelper {
  static LinearGradient gradientColor({double? opacity}) {
    return LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.topLeft,
      colors: <Color>[
        opacity == null
            ? ThemeManager.getSplashColor1()
            : ThemeManager.getSplashColor1().withValues(alpha: opacity),
        opacity == null
            ? ThemeManager.getSplashColor1()
            : ThemeManager.getSplashColor1().withValues(alpha: opacity),
      ],
    );
  }
}
