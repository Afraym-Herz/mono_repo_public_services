import 'package:flutter/material.dart';
import 'package:agreements/core/theme/dimensions.dart';

class CustomInkWell extends StatelessWidget {
  final double? radius;
  final Widget child;
  final Function()? onTap;
  final Color? highlightColor;
  final Color? hoverColor;
  const CustomInkWell({
    super.key,
    this.radius,
    required this.child,
    this.onTap,
    this.highlightColor,
    this.hoverColor,
  });

  @override
  Widget build(BuildContext context) {
    final rad = radius ?? Dimensions.RADIUS_DEFAULT;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(rad),
        highlightColor:
            highlightColor ??
            Theme.of(context).cardColor.withValues(alpha: 0.5),
        hoverColor:
            hoverColor ??
            Theme.of(context).primaryColor.withValues(alpha: 0.12),
        child: child,
      ),
    );
  }
}
