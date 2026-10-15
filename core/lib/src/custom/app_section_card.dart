import 'package:animate_do/animate_do.dart';
import 'package:core/src/theme/app_colors.dart';
import 'package:core/src/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_section_card_header.dart';

final _cardShadow = BoxShadow(
  color: AppColors.black.withValues(alpha: 0.04),
  blurRadius: 12,
  offset: const Offset(0, 4),
);

/// Labelled card grouping content blocks; header shows [icon] + [title].
class AppSectionCard extends StatelessWidget {
  const AppSectionCard({
    super.key, required this.title, required this.icon, required this.child,
    this.animationDelay = Duration.zero, this.headerColor, this.trailing,
  });

  /// Section label displayed in the header row.
  final String title;
  /// Icon shown next to the [title] in the header.
  final IconData icon;
  /// Content placed below the header.
  final Widget child;
  /// Delay before the [FadeInUp] entrance animation plays.
  final Duration animationDelay;
  /// Optional override for the header background colour tint.
  final Color? headerColor;
  /// Optional widget at the trailing end of the header row.
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
        margin: EdgeInsets.only(bottom: Dimensions.paddingSizeDefault.h),
        decoration: BoxDecoration(
          color: scheme.surface,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE.r),
          border: Border.all(
            color: isDark ? AppColors.white.withValues(alpha: 0.08)
                : primary.withValues(alpha: 0.10),
            width: 1,
          ),
          boxShadow: isDark ? null : [_cardShadow],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppSectionCardHeader(
              icon: icon, title: title, primary: primary,
              headerColor: headerColor, trailing: trailing,
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeDefault.r),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
