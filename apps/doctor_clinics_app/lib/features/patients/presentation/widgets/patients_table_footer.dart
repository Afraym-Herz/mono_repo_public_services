import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/patients_count_format.dart';
import 'patients_pagination_controls.dart';

/// Count summary and pagination controls under the register.
class PatientsTableFooter extends StatelessWidget {
  const PatientsTableFooter({
    super.key,
    required this.visibleCount,
    required this.totalCount,
  });

  final int visibleCount;
  final int totalCount;

  @override
  Widget build(BuildContext context) {
    final total = PatientsCountFormat.count(totalCount, context);
    final summary = visibleCount == 0
        ? 'patients.table.showing_none'.tr(namedArgs: {'total': total})
        : 'patients.table.showing'.tr(
            namedArgs: {
              'from': PatientsCountFormat.count(1, context),
              'to': PatientsCountFormat.count(visibleCount, context),
              'total': total,
            },
          );

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_SMALL.h,
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: Dimensions.PADDING_SIZE_SMALL.w,
        runSpacing: Dimensions.PADDING_SIZE_SMALL.h,
        children: [
          ResponsiveText(
            summary,
            fontSize: Dimensions.FONT_SIZE_SMALL,
            fontWeight: FontWeight.w600,
            color: context.clinicTextSecondary,
          ),
          const PatientsPaginationControls(),
        ],
      ),
    );
  }
}
