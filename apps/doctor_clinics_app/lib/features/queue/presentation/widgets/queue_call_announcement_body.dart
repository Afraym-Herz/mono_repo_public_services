import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/queue_ticket.dart';
import '../helpers/queue_format.dart';
import '../helpers/queue_summary_labels.dart';

/// Ticket number, patient name and room line of the announcement.
class QueueCallAnnouncementBody extends StatelessWidget {
  const QueueCallAnnouncementBody({
    super.key,
    required this.ticket,
    required this.doctorName,
  });

  final QueueTicket ticket;
  final String doctorName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.campaign_rounded,
          size: Dimensions.ICON_SIZE_EXTRA_LARGE.r,
          color: context.clinicAccent,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        ResponsiveText(
          'queue_call.title'.tr(),
          fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
          fontWeight: FontWeight.w700,
          color: context.clinicTextSecondary,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
        ResponsiveText(
          QueueFormat.localizedNumber(ticket.queueNumber, context),
          fontSize: Dimensions.FONT_SIZE_DISPLAY,
          fontWeight: FontWeight.w800,
          color: context.clinicAccent,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
        ResponsiveText(
          ticket.patientName,
          fontSize: Dimensions.FONT_SIZE_OVER_OVER_LARGE,
          fontWeight: FontWeight.w700,
          color: context.clinicTextPrimary,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
        ResponsiveText(
          QueueSummaryLabels.room(context, doctorName),
          fontSize: Dimensions.FONT_SIZE_DEFAULT,
          color: context.clinicTextSecondary,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
        AppButton(
          label: 'queue_call.close'.tr(),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
