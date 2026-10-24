import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_filter.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_format.dart';

/// One status tab of the operations board.
class OperationFilterChip extends StatelessWidget {
  const OperationFilterChip({
    super.key,
    required this.filter,
    required this.count,
    required this.isActive,
    required this.onTap,
  });

  final OperationFilter filter;
  final int count;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r);
    return Material(
      color: isActive
          ? context.clinicNavActiveBackground
          : AppColors.transparent,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_SMALL.w,
            vertical: Dimensions.PADDING_SIZE_BORDER.h,
          ),
          child: ResponsiveText(
            '${filter.labelKey.tr()} (${OperationFormat.count(count, context)})',
            fontSize: Dimensions.FONT_SIZE_SMALL,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
            color: isActive
                ? context.clinicPrimary
                : context.clinicTextSecondary,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
