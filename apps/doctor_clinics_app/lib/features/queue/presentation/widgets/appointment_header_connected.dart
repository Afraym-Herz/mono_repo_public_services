import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_clinics_app/features/queue/presentation/cubit/appointment_cubit.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_calendar.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/appointment_booking_dialog.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/appointment_header.dart';

/// [AppointmentHeader] bound to [AppointmentCubit].
///
/// Reads the viewed day/week, the live today/week counts and the submitting
/// flag straight from the planner state, so the header stays in sync after
/// every booking, cancellation or navigation.
class AppointmentHeaderConnected extends StatelessWidget {
  const AppointmentHeaderConnected({super.key, required this.canManage});

  /// Whether the signed-in user may book appointments.
  final bool canManage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        final cubit = context.read<AppointmentCubit>();
        final loaded = state.maybeMap(loaded: (s) => s, orElse: () => null);
        final canBook = canManage && loaded != null && !loaded.isSubmitting;

        return AppointmentHeader(
          mode: loaded?.mode ?? AppointmentViewMode.day,
          anchorDate: loaded?.anchorDate ?? DateTime.now(),
          todayCount: loaded?.todayCount ?? 0,
          weekCount: loaded?.weekCount ?? 0,
          onModeChanged: cubit.setMode,
          onPrevious: () => cubit.move(-1),
          onNext: () => cubit.move(1),
          onToday: cubit.goToday,
          onBook: canBook ? () => _book(context) : null,
          onPrint: () => AppSnackBar.showInfo(
            context,
            'appointment_header.print_unavailable'.tr(),
          ),
        );
      },
    );
  }

  Future<void> _book(BuildContext context) async {
    final state = context.read<AppointmentCubit>().state;
    final anchor = state.maybeMap(
      loaded: (s) => s.anchorDate,
      orElse: () => DateTime.now(),
    );
    final draft = await showAppointmentBookingDialog(
      context,
      initialDate: anchor,
    );
    if (draft == null || !context.mounted) return;
    await context.read<AppointmentCubit>().book(
      patientId: draft.patientId,
      date: draft.date,
      type: draft.type,
      reason: draft.reason,
      notes: draft.notes,
      depositPiasters: draft.depositPiasters,
    );
  }
}
