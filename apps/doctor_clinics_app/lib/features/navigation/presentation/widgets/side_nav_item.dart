import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/navigation/presentation/models/side_nav_destination.dart';

/// Single tappable row inside the side navigation bar.
class SideNavItem extends StatelessWidget {
  const SideNavItem({
    super.key,
    required this.destination,
    required this.isActive,
  });

  final SideNavDestination destination;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final accent = context.clinicAccent;
    final foreground = isActive ? accent : context.clinicTextPrimary;
    final radius = BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h / 2,
      ),
      child: Material(
        color: isActive ? context.clinicNavActiveBackground : AppColors.transparent,
        borderRadius: radius,
        child: InkWell(
          borderRadius: radius,
          hoverColor: accent.withValues(alpha: 0.08),
          onTap: isActive ? null : () => context.go(destination.route),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_SMALL.w,
              vertical: Dimensions.PADDING_SIZE_SMALL.h,
            ),
            child: Row(
              children: [
                Icon(
                  isActive ? destination.activeIcon : destination.icon,
                  size: Dimensions.ICON_SIZE_DEFAULT.r,
                  color: foreground,
                ),
                SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
                Expanded(
                  child: ResponsiveText(
                    destination.labelKey.tr(),
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
    );
  }
}
