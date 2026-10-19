import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/queue_summary_data.dart';
import 'queue_summary_metric.dart';
import 'queue_summary_surface.dart';

/// Status counters (waiting, done, cancelled, no-show) for today's queue.
class QueueSummaryStatsCard extends StatelessWidget {
  const QueueSummaryStatsCard({super.key, required this.data});

  final QueueSummaryData data;

  @override
  Widget build(BuildContext context) {
    return QueueSummarySurface(
      child: Row(
        children: [
          Expanded(
            child: QueueSummaryMetric(
              label: 'queue_filter.waiting'.tr(),
              value: data.waiting,
              color: AppColors.clinicStatusWaiting,
            ),
          ),
          const _Divider(),
          Expanded(
            child: QueueSummaryMetric(
              label: 'queue_filter.done'.tr(),
              value: data.done,
              color: AppColors.clinicStatusDone,
            ),
          ),
          const _Divider(),
          Expanded(
            child: QueueSummaryMetric(
              label: 'queue_filter.cancelled'.tr(),
              value: data.cancelled,
              color: AppColors.clinicStatusCancelled,
            ),
          ),
          const _Divider(),
          Expanded(
            child: QueueSummaryMetric(
              label: 'queue_summary.no_show'.tr(),
              value: data.noShow,
              color: AppColors.clinicStatusUrgent,
            ),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.w,
      height: Dimensions.ICON_SIZE_LARGE.h,
      color: context.clinicBorder,
    );
  }
}
