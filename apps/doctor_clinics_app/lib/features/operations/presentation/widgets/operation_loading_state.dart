import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Skeleton shown while the board loads for the first time.
class OperationLoadingState extends StatelessWidget {
  const OperationLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.PADDING_SIZE_EXTRA_LARGE.h,
      ),
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          color: context.clinicPrimary,
        ),
      ),
    );
  }
}
