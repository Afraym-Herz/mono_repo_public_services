import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:core/src/theme/app_colors.dart';

/// A reusable labelled card that visually groups form fields or content
/// blocks inside any feature screen.
///
/// Wraps its [child] in a styled [Container] with a coloured header row
/// showing an [icon] and [title]. Entry is animated via [FadeInUp].
///
/// Example usage:
/// ```dart
/// AppSectionCard(
///   title: 'البيانات المالية'.tr(),
///   icon: Icons.account_balance_wallet_outlined,
///   animationDelay: const Duration(milliseconds: 200),
///   child: /* form fields */,
/// )
/// ```
class AppSectionCard extends StatelessWidget {
  const AppSectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
    this.animationDelay = Duration.zero,
    this.headerColor,
    this.trailing,
  });

  /// Section label displayed in the header row.
  final String title;

  /// Icon shown to the right of the [title] in the header.
  final IconData icon;

  /// Content placed below the header.
  final Widget child;

  /// Delay before the [FadeInUp] entrance animation plays.
  final Duration animationDelay;

  /// Optional override for the header background colour tint.
  /// Defaults to `primaryColor.withOpacity(isDark ? 0.15 : 0.07)`.
  final Color? headerColor;

  /// Optional widget placed at the trailing end of the header row
  /// (e.g. a toggle button or badge).
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final primary = Theme.of(context).primaryColor;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return FadeInUp(
      delay: animationDelay,
      duration: const Duration(milliseconds: 400),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: scheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : primary.withValues(alpha: 0.10),
            width: 1,
          ),
          boxShadow: isDark
              ? null
              : [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ─── Section header ────────────────────────────────────────────
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color:
                    headerColor ??
                    primary.withValues(alpha: isDark ? 0.15 : 0.07),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              child: Row(
                children: [
                  Icon(icon, size: 18.r, color: primary),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: primary,
                      ),
                    ),
                  ),
                  ?trailing,
                ],
              ),
            ),
            // ─── Section body ──────────────────────────────────────────────
            Padding(padding: EdgeInsets.all(16.r), child: child),
          ],
        ),
      ),
    );
  }
}
