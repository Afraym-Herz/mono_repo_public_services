import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/home/presentation/helpers/home_queue_sample.dart';
import 'package:doctor_clinics_app/features/home/presentation/helpers/home_queue_status.dart';
import 'home_queue_action_button.dart';
import 'home_queue_number_badge.dart';
import 'home_queue_row_meta.dart';
import 'home_queue_status_chip.dart';

/// Content of a "current queue" home row: number badge, identity and actions.
class HomeQueueRowContent extends StatelessWidget {
  const HomeQueueRowContent({super.key, required this.sample});

  final HomeQueueSampleRow sample;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HomeQueueNumberBadge(
          number: sample.number,
          isActive: sample.status == HomeQueueStatus.inConsultation,
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: ResponsiveText(
                      sample.name,
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      fontWeight: FontWeight.w600,
                      color: context.clinicTextPrimary,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
                  HomeQueueStatusChip(status: sample.status),
                ],
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h / 4),
              HomeQueueRowMeta(
                examTypeKey: sample.examTypeKey,
                waitMinutes: sample.waitMinutes,
              ),
            ],
          ),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
        HomeQueueActionButton(action: sample.action),
      ],
    );
  }
}
