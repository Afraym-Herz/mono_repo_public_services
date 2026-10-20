import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Grey bar for one column of a skeleton register row.
class PatientSkeletonCell extends StatelessWidget {
  const PatientSkeletonCell({
    super.key,
    required this.flex,
    this.factor = 0.55,
  });

  final int flex;
  final double factor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: FractionallySizedBox(
          widthFactor: factor,
          child: Container(
            height: Dimensions.FONT_SIZE_SMALL.h,
            decoration: BoxDecoration(
              color: AppColors.shimmerBase,
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
            ),
          ),
        ),
      ),
    );
  }
}
