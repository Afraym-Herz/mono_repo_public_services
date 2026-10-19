import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// One soft out-of-focus circle, positioned inside a branding `Stack`.
class BrandingBlob extends StatelessWidget {
  const BrandingBlob({
    super.key,
    required this.color,
    required this.size,
    this.top,
    this.bottom,
    this.start,
    this.end,
  });

  final Color color;
  final double size;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: top,
      bottom: bottom,
      start: start,
      end: end,
      child: Container(
        width: size.r,
        height: size.r,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
