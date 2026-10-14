import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:core/src/theme/app_colors.dart';

void showAnimatedDialog(
  BuildContext context,
  Widget dialog, {
  bool isFlip = false,
  bool dismissible = true,
}) {
  // Ensure dialog opens after build phase to avoid setState errors
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!context.mounted) {
      debugPrint('showAnimatedDialog: Context is not mounted, aborting');
      return;
    }
    showGeneralDialog(
      context: context,
      barrierDismissible: dismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: AppColors.black.withValues(alpha: 0.5),
      pageBuilder: (context, animation1, animation2) => dialog,
      transitionDuration: const Duration(milliseconds: 500),
      transitionBuilder: (context, a1, a2, widget) {
        if (isFlip) {
          return Rotation3DTransition(
            alignment: Alignment.center,
            turns: Tween<double>(begin: math.pi, end: 2.0 * math.pi).animate(
              CurvedAnimation(
                parent: a1,
                curve: const Interval(0.0, 1.0, curve: Curves.linear),
              ),
            ),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: a1,
                  curve: const Interval(0.5, 1.0, curve: Curves.elasticOut),
                ),
              ),
              child: widget,
            ),
          );
        } else {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(opacity: a1.value, child: widget),
          );
        }
      },
    );
  });
}

class Rotation3DTransition extends AnimatedWidget {
  const Rotation3DTransition({
    super.key,
    required Animation<double> turns,
    this.alignment = Alignment.center,
    required this.child, // Make child non-nullable
  }) : super(listenable: turns);

  Animation<double> get turns => listenable as Animation<double>;
  final Alignment alignment;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double turnsValue = turns.value;
    final Matrix4 transform = Matrix4.identity()
      ..setEntry(3, 2, 0.0006)
      ..rotateY(turnsValue);
    return Transform(
      transform: transform,
      alignment: Alignment.center,
      child: child,
    );
  }
}
