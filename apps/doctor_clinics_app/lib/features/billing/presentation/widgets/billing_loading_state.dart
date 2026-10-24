import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Spinner shown while the accounts snapshot is loading.
class BillingLoadingState extends StatelessWidget {
  const BillingLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.PADDING_SIZE_EXTRA_LARGE.h,
        ),
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          color: context.clinicPrimary,
        ),
      ),
    );
  }
}
