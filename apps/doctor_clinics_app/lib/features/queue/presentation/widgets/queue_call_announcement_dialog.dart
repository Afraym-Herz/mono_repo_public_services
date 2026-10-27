import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/queue_ticket.dart';
import 'queue_call_announcement_body.dart';

/// Shows the large "now calling" card the waiting room reads.
Future<void> showQueueCallAnnouncement(
  BuildContext context, {
  required QueueTicket ticket,
  required String doctorName,
}) {
  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: AppColors.scrim,
    pageBuilder: (_, _, _) =>
        QueueCallAnnouncementDialog(ticket: ticket, doctorName: doctorName),
  );
}

/// Card shell for the waiting-room announcement.
class QueueCallAnnouncementDialog extends StatelessWidget {
  const QueueCallAnnouncementDialog({
    super.key,
    required this.ticket,
    required this.doctorName,
  });

  final QueueTicket ticket;
  final String doctorName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_LARGE.w,
        ),
        child: Material(
          color: AppColors.transparent,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Dimensions.QUEUE_CALL_CARD_WIDTH.w,
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_LARGE.w),
              decoration: BoxDecoration(
                color: context.cardColor,
                borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE.r),
                border: Border.all(color: context.clinicBorder),
              ),
              child: QueueCallAnnouncementBody(
                ticket: ticket,
                doctorName: doctorName,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
