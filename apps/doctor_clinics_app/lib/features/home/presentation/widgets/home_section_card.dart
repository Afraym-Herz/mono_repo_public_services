import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Shared card chrome for the home dashboard sections: surface, hairline
/// border, rounded corners and a staggered fade-in.
///
/// When the card receives a tight height it fills that height. Content that
/// uses vertical flex (the queue) can opt into [fillHeight]; every other card is
/// measured naturally, stretched with its own [MainAxisAlignment.spaceBetween],
/// and scaled down only when the available height cannot hold it.
class HomeSectionCard extends StatelessWidget {
  const HomeSectionCard({
    super.key,
    required this.child,
    this.animationDelay = Duration.zero,
    this.fillHeight = false,
  });

  /// Section content.
  final Widget child;

  /// Delay before the entrance animation plays.
  final Duration animationDelay;

  /// Whether [child] should receive a tight height and manage the flex itself.
  final bool fillHeight;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: animationDelay,
      duration: const Duration(milliseconds: 400),
      child: Container(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL.r),
        decoration: BoxDecoration(
          color: context.cardColor,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r),
          border: Border.all(color: context.clinicBorder),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (!constraints.hasBoundedHeight ||
                !constraints.hasTightHeight) {
              return child;
            }

            if (fillHeight) {
              return SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: child,
              );
            }

            return FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.topCenter,
              child: SizedBox(
                width: constraints.maxWidth,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: child,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
