import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/home/presentation/helpers/home_queue_status.dart';

/// Color-coded status chip on a queue row.
///
/// Tints derive from the clinical semantic tokens (DESIGN (2).md mappings) so no
/// hex values live in the app.
class HomeQueueStatusChip extends StatelessWidget {
  const HomeQueueStatusChip({super.key, required this.status});

  /// Status this chip represents.
  final HomeQueueStatus status;

  @override
  Widget build(BuildContext context) {
    final color = _colorFor(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: context.clinicIsDark ? 0.22 : 0.12),
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: ResponsiveText(
        status.labelKey.tr(),
        fontSize: Dimensions.FONT_SIZE_SMALL,
        fontWeight: FontWeight.w700,
        color: color,
        maxLines: 1,
      ),
    );
  }

  Color _colorFor(BuildContext context) => switch (status) {
        HomeQueueStatus.inConsultation => context.clinicAccent,
        HomeQueueStatus.waiting => AppColors.warningDark,
        HomeQueueStatus.urgent => AppColors.clinicError,
        HomeQueueStatus.booked => AppColors.info,
        HomeQueueStatus.done => AppColors.successDark,
      };
}
