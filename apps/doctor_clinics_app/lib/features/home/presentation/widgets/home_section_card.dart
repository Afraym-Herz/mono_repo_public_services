import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Shared card chrome for the home dashboard sections: surface, hairline
/// border, rounded corners and a staggered fade-in.
class HomeSectionCard extends StatelessWidget {
  const HomeSectionCard({
    super.key,
    required this.child,
    this.animationDelay = Duration.zero,
  });

  /// Section content.
  final Widget child;

  /// Delay before the entrance animation plays.
  final Duration animationDelay;

  @override
  Widget build(BuildContext context) {
    final surface =
        context.clinicIsDark ? context.clinicContainer : context.cardColor;

    return FadeInUp(
      delay: animationDelay,
      duration: const Duration(milliseconds: 400),
      child: Container(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault.r),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r),
          border: Border.all(color: context.clinicBorder),
        ),
        child: child,
      ),
    );
  }
}
