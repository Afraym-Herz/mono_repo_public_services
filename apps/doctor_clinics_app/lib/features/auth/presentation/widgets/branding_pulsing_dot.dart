import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Softly looping "live" status indicator (breathe-in/out).
class BrandingPulsingDot extends StatefulWidget {
  const BrandingPulsingDot({super.key});

  @override
  State<BrandingPulsingDot> createState() => _BrandingPulsingDotState();
}

class _BrandingPulsingDotState extends State<BrandingPulsingDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _scale = Tween<double>(begin: 0.75, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _scale,
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          width: Dimensions.ICON_SIZE_VERY_SMALL.r,
          height: Dimensions.ICON_SIZE_VERY_SMALL.r,
          decoration: BoxDecoration(
            color: context.clinicAccent,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
