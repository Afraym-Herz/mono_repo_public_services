import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/home/presentation/helpers/home_queue_sample.dart';
import 'home_queue_row.dart';

/// The "Current Queue" panel on the home dashboard.
///
/// Features the queue title row (live status indicator), the list of rows
/// (populated with [homeQueueSampleRows]), and a footer button that links to
/// the full queue screen.
class HomeQueuePanel extends StatelessWidget {
  const HomeQueuePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSectionCard(
      title: 'home_queue_panel_title'.tr(),
      icon: Icons.dashboard_customize_outlined,
      trailing: _LiveBadge(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...homeQueueSampleRows.map((sample) => HomeQueueRow(sample: sample)),
          SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT.h),
          _FooterButton(),
        ],
      ),
    );
  }
}

/// "Live" indicator for the panel header.
class _LiveBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: Dimensions.ICON_SIZE_VERY_SMALL.r,
          height: Dimensions.ICON_SIZE_VERY_SMALL.r,
          decoration: const BoxDecoration(
            color: AppColors.success,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
        ResponsiveText(
          'home_queue_live'.tr(),
          fontSize: Dimensions.FONT_SIZE_SMALL,
          color: context.clinicTextSecondary,
        ),
      ],
    );
  }
}

/// Link to the full queue workspace.
class _FooterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      radius: Dimensions.RADIUS_DEFAULT.r,
      onTap: () => context.go(Routes.queue),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.PADDING_SIZE_SMALL.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResponsiveText(
              'home_queue_footer_link'.tr(),
              fontSize: Dimensions.FONT_SIZE_SMALL,
              fontWeight: FontWeight.w700,
              color: context.clinicPrimary,
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
            Icon(
              Icons.arrow_forward_rounded,
              size: Dimensions.ICON_SIZE_SMALL.r,
              color: context.clinicPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
