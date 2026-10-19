import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/home/presentation/helpers/home_queue_sample.dart';
import 'home_queue_action_button.dart';
import 'home_queue_number_badge.dart';
import 'home_queue_row_meta.dart';
import 'home_queue_status_chip.dart';

/// Single row in the "Current Queue" home dashboard panel.
class HomeQueueRow extends StatelessWidget {
  const HomeQueueRow({super.key, required this.sample});

  final HomeQueueSampleRow sample;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.PADDING_SIZE_SMALL.h,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.clinicBorder),
        ),
      ),
      child: Row(
        children: [
          HomeQueueNumberBadge(number: sample.number),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveText(
                  sample.name,
                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  fontWeight: FontWeight.w600,
                  color: context.clinicTextPrimary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h / 4),
                HomeQueueRowMeta(
                  examTypeKey: sample.examTypeKey,
                  waitMinutes: sample.waitMinutes,
                  appointmentTime: sample.appointmentTime,
                ),
              ],
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          HomeQueueStatusChip(status: sample.status),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          HomeQueueActionButton(action: sample.action),
        ],
      ),
    );
  }
}
