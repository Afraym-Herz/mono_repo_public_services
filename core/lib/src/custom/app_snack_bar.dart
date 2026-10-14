import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    backgroundColor: Colors.green.shade700,
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
    backgroundColor: Colors.orange.shade700,
    icon: Icons.warning_amber_rounded,
  );

  static void showInfo(BuildContext context, String message) => _show(
    context,
    message: message,
    backgroundColor: Colors.blueAccent.shade700,
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
              Icon(icon, color: Colors.white, size: 20.r),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(fontSize: 13.sp, color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          duration: duration,
        ),
      );
  }
}
