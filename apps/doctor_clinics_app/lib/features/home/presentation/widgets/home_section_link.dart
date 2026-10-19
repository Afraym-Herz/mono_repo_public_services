import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// Centered "view all" link at the foot of a home section card.
///
/// `arrow_forward_rounded` is RTL-aware and mirrors itself, so it points left in
/// Arabic, matching the design.
class HomeSectionLink extends StatelessWidget {
  const HomeSectionLink({super.key, required this.label, required this.route});

  /// Already-localized link caption.
  final String label;

  /// Route opened when the link is tapped.
  final String route;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      radius: Dimensions.RADIUS_DEFAULT.r,
      onTap: () => context.go(route),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResponsiveText(
              label,
              fontSize: Dimensions.FONT_SIZE_SMALL,
              fontWeight: FontWeight.w700,
              color: context.clinicAccent,
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
            Icon(
              Icons.arrow_forward_rounded,
              size: Dimensions.ICON_SIZE_SMALL.r,
              color: context.clinicAccent,
            ),
          ],
        ),
      ),
    );
  }
}
