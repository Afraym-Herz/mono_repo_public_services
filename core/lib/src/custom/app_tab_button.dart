import 'package:core/src/theme/app_colors.dart';
import 'package:core/src/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_tab_button_label.dart';
import 'app_tab_button_style.dart';

/// A single animated tab button used inside a segmented tab bar.
///
/// Highlights itself with the brand primary colour when [isActive] is `true`.
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
    final style = resolveAppTabButtonStyle(context, isActive);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeInOut,
      decoration: style.decoration,
      child: Material(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.PADDING_SIZE_SMALL.h,
              horizontal: Dimensions.PADDING_SIZE_SMALL.w,
            ),
            child: AppTabButtonLabel(
              label: label,
              icon: icon,
              isActive: isActive,
              contentColor: style.contentColor,
            ),
          ),
        ),
      ),
    );
  }
}
