import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/booked_appointment.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_board_row.dart';
import '../cubit/queue_cubit.dart';
import 'queue_booked_tile.dart';

class QueueBookedSliver extends StatelessWidget {
  const QueueBookedSliver({
    super.key,
    required this.booked,
    this.onTicketTap,
    this.isSubmitting = false,
  });

  final List<BookedAppointment> booked;
  final ValueChanged<QueueBoardRow>? onTicketTap;
  final bool isSubmitting;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QueueCubit>();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final appt = booked[index];
          return Padding(
            padding: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL.h),
            child: QueueBookedTile(
              appointment: appt,
              isSubmitting: isSubmitting,
              onTap: () => onTicketTap?.call(QueueBoardRow.booked(appt)),
              onCheckIn: () => cubit.checkIn(appt.appointmentId),
              onCancel: () => cubit.cancelAppointment(
                appt.appointmentId,
                AppConstants.queueCancelReasonStaff,
              ),
            ),
          );
        },
        childCount: booked.length,
      ),
    );
  }
}
