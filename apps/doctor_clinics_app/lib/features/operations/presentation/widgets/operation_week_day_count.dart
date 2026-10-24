import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_format.dart';

/// Daily operation count pill on the week strip.
class OperationWeekDayCount extends StatelessWidget {
  const OperationWeekDayCount({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_BORDER.w,
        vertical: 1,
      ),
      decoration: BoxDecoration(
        color: count > 0 ? context.clinicContainer : AppColors.transparent,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
      ),
      child: ResponsiveText(
        OperationFormat.count(count, context),
        fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
        fontWeight: FontWeight.w700,
        color: count > 0
            ? context.clinicTextPrimary
            : context.clinicTextSecondary,
      ),
    );
  }
}
