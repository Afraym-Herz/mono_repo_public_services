import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/patients_count_format.dart';
import '../helpers/patients_pagination.dart';
import 'patients_pagination_controls.dart';

/// Count summary and pagination controls under the register.
class PatientsTableFooter extends StatelessWidget {
  const PatientsTableFooter({
    super.key,
    required this.from,
    required this.to,
    required this.totalCount,
    required this.page,
    this.onPrevious,
    this.onNext,
  });

  /// First row number on the current page (1-based), or 0 when empty.
  final int from;

  /// Last row number on the current page (1-based), or 0 when empty.
  final int to;

  /// Rows matching the active search/filter.
  final int totalCount;

  /// Zero-based current page.
  final int page;

  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final total = PatientsCountFormat.count(totalCount, context);
    final summary = totalCount == 0
        ? 'patients.table.showing_none'.tr()
        : 'patients.table.showing'.tr(
            namedArgs: {
              'from': PatientsCountFormat.count(from, context),
              'to': PatientsCountFormat.count(to, context),
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
          PatientsPaginationControls(
            page: page,
            pageCount: PatientsPagination.pageCount(totalCount),
            onPrevious: onPrevious,
            onNext: onNext,
          ),
        ],
      ),
    );
  }
}
