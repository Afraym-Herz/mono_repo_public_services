import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Single tappable row inside the side navigation bar (destinations + settings).
class SideNavItem extends StatelessWidget {
  const SideNavItem({
    super.key,
    required this.icon,
    required this.activeIcon,
    required this.label,
    this.onTap,
    this.isActive = false,
    this.delay = Duration.zero,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final VoidCallback? onTap;
  final bool isActive;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    final accent = context.clinicAccent;
    final foreground = isActive ? accent : context.clinicTextPrimary;
    final radius = BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r);
    return FadeInUp(
      delay: delay,
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
          vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h / 2,
        ),
        child: Material(
          color: isActive
              ? context.clinicNavActiveBackground
              : AppColors.transparent,
          borderRadius: radius,
          child: InkWell(
            borderRadius: radius,
            hoverColor: accent.withValues(alpha: 0.08),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_SMALL.w,
                vertical: Dimensions.PADDING_SIZE_SMALL.h,
              ),
              child: Row(
                children: [
                  Icon(
                    isActive ? activeIcon : icon,
                    size: Dimensions.ICON_SIZE_DEFAULT.r,
                    color: foreground,
                  ),
                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
                  Expanded(
                    child: ResponsiveText(
                      label,
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                      color: foreground,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
