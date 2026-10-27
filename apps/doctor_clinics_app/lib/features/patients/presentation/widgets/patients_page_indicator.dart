import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/patients_count_format.dart';

/// "1 / 3" page badge, localized to the active locale's digits.
class PatientsPageIndicator extends StatelessWidget {
  const PatientsPageIndicator({
    super.key,
    required this.page,
    required this.pageCount,
  });

  /// Zero-based current page.
  final int page;

  /// Total number of pages; 0 when the register has no matching rows.
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    final current = pageCount == 0 ? 0 : page + 1;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: context.clinicNavActiveBackground,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
      ),
      child: ResponsiveText(
        'patients.table.page_of'.tr(
          namedArgs: {
            'page': PatientsCountFormat.count(current, context),
            'pages': PatientsCountFormat.count(pageCount, context),
          },
        ),
        fontSize: Dimensions.FONT_SIZE_SMALL,
        fontWeight: FontWeight.w700,
        color: context.clinicTextPrimary,
      ),
    );
  }
}
