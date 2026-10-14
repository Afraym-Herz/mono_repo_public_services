import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A single animated tab button used inside a segmented tab bar.
///
/// Highlights itself with the brand primary colour when [isActive] is `true`;
/// otherwise renders a subtle outlined surface. Combines an optional [icon]
/// with a [label] and animates background / border / shadow transitions.
///
/// Example usage:
/// ```dart
/// Row(
///   children: [
///     Expanded(
///       child: AppTabButton(
///         label: 'البيانات الأساسية',
///         icon: Icons.inventory_2_outlined,
///         isActive: currentIndex == 0,
///         onTap: () => setState(() => currentIndex = 0),
///       ),
///     ),
///     SizedBox(width: 10.w),
///     Expanded(
///       child: AppTabButton(
///         label: 'البيانات الأخرى',
///         icon: Icons.tune_rounded,
///         isActive: currentIndex == 1,
///         onTap: () => setState(() => currentIndex = 1),
///       ),
///     ),
///   ],
/// )
/// ```
class AppTabButton extends StatelessWidget {
  const AppTabButton({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.icon,
  });

  /// Text shown inside the button.
  final String label;

  /// Whether this tab is currently selected.
  final bool isActive;

  /// Called when the user taps the button.
  final VoidCallback onTap;

  /// Optional leading icon.
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor = isActive
        ? primary
        : (isDark
              ? scheme.surfaceContainerHighest.withValues(alpha: 0.4)
              : scheme.surfaceContainerHighest.withValues(alpha: 0.6));

    final contentColor = isActive
        ? Colors.white
        : scheme.onSurface.withValues(alpha: 0.65);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
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
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 16.r, color: contentColor),
                  SizedBox(width: 6.w),
                ],
                Flexible(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                      color: contentColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
