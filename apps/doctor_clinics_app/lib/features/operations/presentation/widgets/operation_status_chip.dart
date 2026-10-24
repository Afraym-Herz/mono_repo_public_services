import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_status_style.dart';

/// Status badge of one operation card.
class OperationStatusChip extends StatelessWidget {
  const OperationStatusChip({super.key, required this.status});

  final String? status;

  @override
  Widget build(BuildContext context) {
    final style = OperationStatusStyle.forStatus(context, status);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h / 2,
      ),
      decoration: BoxDecoration(
        color: style.background,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
        border: Border.all(color: style.border),
      ),
      child: ResponsiveText(
        style.labelKey.tr(),
        fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
        fontWeight: FontWeight.w600,
        color: style.color,
        maxLines: 1,
      ),
    );
  }
}
