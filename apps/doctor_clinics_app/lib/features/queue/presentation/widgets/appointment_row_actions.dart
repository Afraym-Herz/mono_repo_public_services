import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';
import 'package:doctor_clinics_app/features/queue/presentation/cubit/appointment_cubit.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_calendar.dart';

/// Secretary-only actions on a booked appointment.
class AppointmentRowActions {
  AppointmentRowActions._();

  static Future<void> reschedule(
    BuildContext context,
    AppointmentListItem item,
  ) async {
    final today = AppointmentCalendar.dayOf(DateTime.now());
    final initial = item.scheduledDate.isBefore(today)
        ? today
        : item.scheduledDate;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: today,
      lastDate: today.add(const Duration(days: 365)),
    );
    if (picked == null || !context.mounted) return;
    await context.read<AppointmentCubit>().reschedule(
      item.appointmentId,
      picked,
    );
  }

  static Future<void> cancel(
    BuildContext context,
    AppointmentListItem item,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('appointment_row.cancel_title'.tr()),
        content: Text('appointment_row.cancel_body'.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text('appointment_row.keep'.tr()),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text('appointment_row.cancel'.tr()),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    await context.read<AppointmentCubit>().cancel(item.appointmentId);
  }
}
