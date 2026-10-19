import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/queue_ticket.dart';
import '../helpers/queue_summary_labels.dart';
import 'queue_summary_meta_item.dart';

/// Name, room and elapsed time of the patient in consultation.
class QueueSummaryCurrentIdentity extends StatelessWidget {
  const QueueSummaryCurrentIdentity({
    super.key,
    required this.ticket,
    required this.doctorName,
  });

  final QueueTicket ticket;
  final String doctorName;

  @override
  Widget build(BuildContext context) {
    final duration = QueueSummaryLabels.elapsed(context, ticket);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'queue_summary.current_title'.tr(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            fontSize: Dimensions.FONT_SIZE_SMALL.sp,
            color: context.clinicTextSecondary,
          ),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
        Text(
          ticket.patientName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontSize: Dimensions.FONT_SIZE_LARGE.sp,
            fontWeight: FontWeight.w700,
            color: context.clinicTextPrimary,
          ),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_MEDIUM_BORDER.h),
        Wrap(
          spacing: Dimensions.PADDING_SIZE_SMALL.w,
          runSpacing: Dimensions.PADDING_SIZE_BORDER.h,
          children: [
            QueueSummaryMetaItem(
              icon: Icons.meeting_room_outlined,
              label: QueueSummaryLabels.room(context, doctorName),
            ),
            QueueSummaryMetaItem(icon: Icons.schedule_rounded, label: duration),
          ],
        ),
      ],
    );
  }
}
