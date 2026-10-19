import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/booked_appointment.dart';
import '../helpers/queue_row_state.dart';
import 'queue_action_button.dart';
import 'queue_booked_body.dart';
import 'queue_ticket_surface.dart';

class QueueBookedTile extends StatelessWidget {
  const QueueBookedTile({
    super.key,
    required this.appointment,
    this.onTap,
    required this.onCheckIn,
    required this.onCancel,
    this.isSubmitting = false,
  });

  final BookedAppointment appointment;
  final VoidCallback? onTap;
  final VoidCallback onCheckIn;
  final VoidCallback onCancel;
  final bool isSubmitting;

  @override
  Widget build(BuildContext context) {
    final letter = appointment.patientName.trim().isNotEmpty
        ? appointment.patientName.trim().characters.first
        : '?';
    return QueueTicketSurface(
      rowState: QueueRowState.booked,
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: Dimensions.RADIUS_DEFAULT.r * 1.8,
            backgroundColor: AppColors.clinicStatusBookedBg,
            child: Text(
              letter,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.clinicStatusBooked,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(width: Dimensions.paddingSizeDefault.w),
          Expanded(
            child: QueueBookedBody(appointment: appointment),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Wrap(
            spacing: Dimensions.PADDING_SIZE_SMALL.w,
            children: [
              QueueActionButton(
                label: 'queue_row.action.check_in'.tr(),
                onPressed: onCheckIn,
                isSubmitting: isSubmitting,
              ),
              QueueActionButton(
                label: 'queue_row.action.cancel'.tr(),
                onPressed: onCancel,
                isDanger: true,
                isSubmitting: isSubmitting,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
