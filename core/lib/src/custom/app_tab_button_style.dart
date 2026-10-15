import 'package:core/src/theme/app_colors.dart';
import 'package:core/src/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Resolved colours + decoration for [AppTabButton] (see `app_tab_button.dart`).
class AppTabButtonStyle {
  const AppTabButtonStyle({
    required this.background,
    required this.contentColor,
    required this.decoration,
  });

  final Color background;
  final Color contentColor;
  final BoxDecoration decoration;
}

AppTabButtonStyle resolveAppTabButtonStyle(
  BuildContext context,
  bool isActive,
) {
  final primary = Theme.of(context).primaryColor;
  final scheme = Theme.of(context).colorScheme;
  final isDark = Theme.of(context).brightness == Brightness.dark;

  final background = isActive
      ? primary
      : scheme.surfaceContainerHighest.withValues(alpha: isDark ? 0.4 : 0.6);
  final contentColor = isActive
      ? AppColors.white
      : scheme.onSurface.withValues(alpha: 0.65);

  return AppTabButtonStyle(
    background: background,
    contentColor: contentColor,
    decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
      border: isActive
          ? null
          : Border.all(
              color: scheme.outline.withValues(alpha: 0.35),
              width: 1,
            ),
      boxShadow: isActive
          ? [
              BoxShadow(
                color: primary.withValues(alpha: 0.30),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ]
          : null,
    ),
  );
}
