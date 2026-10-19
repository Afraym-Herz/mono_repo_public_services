import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/home/presentation/helpers/home_queue_sample.dart';

/// "View full queue" link at the foot of the home queue panel.
///
/// `arrow_forward_rounded` is RTL-aware and mirrors itself, so it points left in
/// Arabic, matching the design.
class HomeQueuePanelFooter extends StatelessWidget {
  const HomeQueuePanelFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      radius: Dimensions.RADIUS_DEFAULT.r,
      onTap: () => context.go(Routes.queue),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResponsiveText(
              'home_queue_view_all'.tr(
                namedArgs: {
                  'count': DateConverter.withLocalizedDigits(
                    '${homeQueueSampleRows.length}',
                    context.locale.toString(),
                  ),
                },
              ),
              fontSize: Dimensions.FONT_SIZE_SMALL,
              fontWeight: FontWeight.w700,
              color: context.clinicAccent,
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
            Icon(
              Icons.arrow_forward_rounded,
              size: Dimensions.ICON_SIZE_SMALL.r,
              color: context.clinicAccent,
            ),
          ],
        ),
      ),
    );
  }
}
