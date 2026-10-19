import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Slim rounded progress track that fills from the leading edge (right in RTL).
class HomeStatProgressBar extends StatelessWidget {
  const HomeStatProgressBar({super.key, required this.value});

  /// Fill ratio in the `0.0`–`1.0` range.
  final double value;

  @override
  Widget build(BuildContext context) {
    final accent = context.clinicAccent;
    final track = accent.withValues(alpha: context.clinicIsDark ? 0.22 : 0.14);

    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
      child: Container(
        height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h / 2,
        color: track,
        child: FractionallySizedBox(
          alignment: AlignmentDirectional.centerStart,
          widthFactor: value.clamp(0.0, 1.0).toDouble(),
          child: DecoratedBox(decoration: BoxDecoration(color: accent)),
        ),
      ),
    );
  }
}
