import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/patients/presentation/helpers/open_patient_profile.dart';
import 'package:doctor_clinics_app/features/queue/presentation/cubit/queue_cubit.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/schedule_permissions.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/appointment_booking_dialog.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/queue_list.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/queue_list_head.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/queue_summary_strip.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/today_queue_header.dart';

class QueueBody extends StatelessWidget {
  const QueueBody({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Dimensions.PADDING_SIZE_LARGE.w;
    final canManage = canManageSchedule();
    return Scaffold(
      backgroundColor: context.clinicBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder<QueueCubit, QueueState>(
            builder: (context, state) {
              final loaded = state.maybeMap(
                loaded: (s) => s,
                orElse: () => null,
              );
              final canAdd = canManage && loaded != null;
              // Keep the pill mounted while an action is submitting so the
              // header does not reflow (button disappears then reappears on
              // every row action); it is just disabled until the reload lands.
              return TodayQueueHeader(
                onAddWalkIn: canAdd ? () => _addWalkIn(context) : null,
                isAddWalkInEnabled: loaded != null && !loaded.isSubmitting,
              );
            },
          ),
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

  Future<void> _addWalkIn(BuildContext context) async {
    final draft = await showAppointmentBookingDialog(
      context,
      initialDate: DateTime.now(),
      isWalkIn: true,
    );
    if (draft == null || !context.mounted) return;
    await context.read<QueueCubit>().addWalkIn(
      draft.patientId,
      notes: draft.notes,
      depositPiasters: draft.depositPiasters,
    );
  }
}
