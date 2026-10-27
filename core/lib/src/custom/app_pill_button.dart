import 'package:core/src/responsive/responsive_text.dart';
import 'package:core/src/theme/app_colors.dart';
import 'package:core/src/theme/color_extensions.dart';
import 'package:core/src/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Flat pill action used by feature header blocks (home greeting, queue banner,
/// …): a leading icon + label on either a solid primary surface or a muted
/// container. Unlike [AppButton] it stays flat — no elevation — matching the
/// clinical DESIGN (2).md header actions.
class AppPillButton extends StatelessWidget {
  const AppPillButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.primary = false,
    this.outlined = false,
    this.iconTrailing = false,
    this.enabled = true,
  });

  /// Leading icon (or trailing when [iconTrailing] is `true`).
  final IconData icon;

  /// Already-localized label text.
  final String label;

  /// Called when the pill is tapped. Ignored while [enabled] is `false`.
  final VoidCallback onTap;

  /// When `false` the pill is dimmed and stops accepting taps without leaving
  /// the row (so the header layout does not reflow between states).
  final bool enabled;

  /// When `true` the pill is filled with the primary clinical colour; otherwise
  /// it sits on the muted container tone.
  final bool primary;

  /// Draws a bordered surface pill (white in light mode) instead of the muted
  /// container fill. Ignored when [primary] is `true`.
  final bool outlined;

  /// Places [icon] after the label, so it lands on the leading edge in RTL.
  final bool iconTrailing;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r);
    final background = primary
        ? context.clinicSubmitButton
        : outlined
        ? (context.clinicIsDark
              ? AppColors.clinicSurfaceContainerDark
              : AppColors.surfaceWhite)
        : context.clinicContainer;
    final foreground = primary ? AppColors.white : context.clinicTextPrimary;

    return IgnorePointer(
      ignoring: !enabled,
      child: Opacity(
        opacity: enabled ? 1 : 0.5,
        child: Material(
          color: background,
          shape: RoundedRectangleBorder(
            borderRadius: radius,
            side: outlined && !primary
                ? BorderSide(color: context.clinicBorder)
                : BorderSide.none,
          ),
          child: InkWell(
            borderRadius: radius,
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_LARGE.w,
                vertical: Dimensions.PADDING_SIZE_SMALL.h,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!iconTrailing) ...[
                    Icon(
                      icon,
                      size: Dimensions.ICON_SIZE_SMALL.r,
                      color: foreground,
                    ),
                    SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
                  ],
                  ResponsiveText(
                    label,
                    fontSize: Dimensions.FONT_SIZE_SMALL,
                    fontWeight: FontWeight.w600,
                    color: foreground,
                    maxLines: 1,
                  ),
                  if (iconTrailing) ...[
                    SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
                    Icon(
                      icon,
                      size: Dimensions.ICON_SIZE_SMALL.r,
                      color: foreground,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
