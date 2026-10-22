import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Two profile fields side by side on wide layouts, stacked on mobile.
class PatientProfileFieldPair extends StatelessWidget {
  const PatientProfileFieldPair({
    super.key,
    required this.leading,
    required this.trailing,
  });

  final Widget leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    if (context.isMobileOrSmallTablet) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          leading,
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          trailing,
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: leading),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        Expanded(child: trailing),
      ],
    );
  }
}
