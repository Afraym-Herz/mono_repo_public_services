import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:core/src/theme/app_colors.dart';
import 'package:core/src/theme/dimensions.dart';

/// Centralised snackbar utility for the whole app.
///
/// Usage:
/// ```dart
/// AppSnackBar.showSuccess(context, 'Customer saved!');
/// AppSnackBar.showError(context, 'Something went wrong');
/// AppSnackBar.showWarning(context, 'Weak internet connection');
/// AppSnackBar.showInfo(context, 'Syncing data…');
/// ```
class AppSnackBar {
  AppSnackBar._();

  // ─── Public API ───────────────────────────────────────────────────────────

  static void showSuccess(BuildContext context, String message) => _show(
    context,
    message: message,
    backgroundColor: AppColors.successDark,
    icon: Icons.check_circle_outline_rounded,
  );

  static void showError(BuildContext context, String message) => _show(
    context,
    message: message,
    backgroundColor: Theme.of(context).colorScheme.error,
    icon: Icons.error_outline_rounded,
  );

  static void showWarning(BuildContext context, String message) => _show(
    context,
    message: message,
    backgroundColor: AppColors.warningDark,
    icon: Icons.warning_amber_rounded,
  );

  static void showInfo(BuildContext context, String message) => _show(
    context,
    message: message,
    backgroundColor: AppColors.infoDark,
    icon: Icons.info_outline_rounded,
  );

  // ─── Internal ─────────────────────────────────────────────────────────────

  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required IconData icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(icon, color: AppColors.white, size: Dimensions.NAVBAR_ICON_SIZE.r),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: Dimensions.FONT_SIZE_SMALL.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
          ),
          duration: duration,
        ),
      );
  }
}
