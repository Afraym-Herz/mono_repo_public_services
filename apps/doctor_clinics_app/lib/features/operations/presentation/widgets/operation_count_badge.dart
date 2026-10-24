import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_format.dart';

/// Capsule showing how many operations are stored on the station.
class OperationCountBadge extends StatelessWidget {
  const OperationCountBadge({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h / 2,
      ),
      decoration: BoxDecoration(
        color: context.clinicContainer,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
        border: Border.all(color: context.clinicBorder),
      ),
      child: ResponsiveText(
        'operations_board.header.count'.tr(
          namedArgs: {'count': OperationFormat.count(count, context)},
        ),
        fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
        fontWeight: FontWeight.w600,
        color: context.clinicTextSecondary,
        maxLines: 1,
      ),
    );
  }
}
