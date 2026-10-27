import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/patients/presentation/helpers/open_patient_profile.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/queue_list.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/queue_list_head.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/queue_summary_strip.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/today_queue_header_connected.dart';

class QueueBody extends StatelessWidget {
  const QueueBody({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Dimensions.PADDING_SIZE_LARGE.w;
    return Scaffold(
      backgroundColor: context.clinicBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TodayQueueHeaderConnected(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: const QueueSummaryStrip(),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: const QueueListHead(delay: Duration(milliseconds: 250)),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: QueueList(
                onTicketTap: (row) =>
                    openPatientProfileById(context, row.ticket.patientId),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
