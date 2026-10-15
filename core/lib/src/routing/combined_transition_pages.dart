import 'package:core/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Pages composing a slide + fade transition (see `animation_route.dart`).
CustomTransitionPage<void> _slideFadePage(
  Widget child, {
  required Duration duration,
  required Offset begin,
  required Curve curve,
  bool opaque = true,
  Color? barrierColor,
  bool barrierDismissible = true,
}) {
  final slideTween = Tween(begin: begin, end: Offset.zero).chain(
    CurveTween(curve: curve),
  );
  final fadeTween = Tween(begin: 0.0, end: 1.0).chain(
    CurveTween(curve: curve),
  );
  return CustomTransitionPage(
    child: child,
    opaque: opaque,
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(slideTween),
        child: FadeTransition(
          opacity: animation.drive(fadeTween),
          child: child,
        ),
      );
    },
  );
}

CustomTransitionPage<void> transparentModalRoutePage(Widget child) {
  return _slideFadePage(
    child,
    duration: const Duration(milliseconds: 350),
    begin: const Offset(0, 0.04),
    curve: Curves.easeOutCubic,
    opaque: false,
    barrierColor: AppColors.scrim,
    barrierDismissible: false,
  );
}

CustomTransitionPage<void> slideFadeTransitionPage(Widget child) {
  return _slideFadePage(
    child,
    duration: const Duration(milliseconds: 700),
    begin: const Offset(0, 1), // يدخل من تحت
    curve: Curves.easeIn,
  );
}
