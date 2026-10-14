import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<void> fadeTransitionPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionDuration: const Duration(milliseconds: 700),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return FadeTransition(opacity: animation.drive(tween), child: child);
    },
  );
}

CustomTransitionPage<void> transparentModalRoutePage(Widget child) {
  return CustomTransitionPage(
    child: child,
    opaque: false,
    barrierColor: const Color(0x8C000000),
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 350),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0, 0.04);
      const end = Offset.zero;
      const curve = Curves.easeOutCubic;

      var slideTween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: curve));
      var fadeTween = Tween(
        begin: 0.0,
        end: 1.0,
      ).chain(CurveTween(curve: curve));

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

CustomTransitionPage<void> slideTransitionPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1, 0); // يدخل من اليمين
      const end = Offset.zero;
      const curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

CustomTransitionPage<void> scaleTransitionPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionDuration: const Duration(milliseconds: 600),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0; // تبدأ صغيرة جدًا
      const end = 1.0; // تنتهي بحجمها الطبيعي
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return ScaleTransition(scale: animation.drive(tween), child: child);
    },
  );
}

CustomTransitionPage<void> rotateTransitionPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionDuration: const Duration(milliseconds: 800),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0; // بدون تدوير
      const end = 1.0; // تدوير كامل (360 درجة)
      const curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return RotationTransition(turns: animation.drive(tween), child: child);
    },
  );
}

CustomTransitionPage<void> slideFadeTransitionPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionDuration: const Duration(milliseconds: 700),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const beginSlide = Offset(0, 1); // يدخل من تحت
      const endSlide = Offset.zero;
      const beginFade = 0.0; // شفاف في البداية
      const endFade = 1.0; // واضح في النهاية
      const curve = Curves.easeIn;

      var slideTween = Tween(
        begin: beginSlide,
        end: endSlide,
      ).chain(CurveTween(curve: curve));
      var fadeTween = Tween(
        begin: beginFade,
        end: endFade,
      ).chain(CurveTween(curve: curve));

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
