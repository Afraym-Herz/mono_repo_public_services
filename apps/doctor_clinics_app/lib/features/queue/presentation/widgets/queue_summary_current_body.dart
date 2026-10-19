import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/queue_ticket.dart';
import 'queue_summary_current_identity.dart';
import 'queue_summary_icon_chip.dart';

/// Identity block of the patient currently in consultation.
class QueueSummaryCurrentBody extends StatelessWidget {
  const QueueSummaryCurrentBody({
    super.key,
    required this.ticket,
    required this.doctorName,
  });

  final QueueTicket ticket;
  final String doctorName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QueueSummaryIconChip(
          icon: Icons.medical_services_outlined,
          color: AppColors.clinicPrimaryContainer,
          filled: true,
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        Expanded(
          child: QueueSummaryCurrentIdentity(
            ticket: ticket,
            doctorName: doctorName,
          ),
        ),
      ],
    );
  }
}
