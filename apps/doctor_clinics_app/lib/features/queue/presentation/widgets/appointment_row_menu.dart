import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';
import 'appointment_row_actions.dart';

/// Secretary-only overflow menu on a booked appointment row.
class AppointmentRowMenu extends StatelessWidget {
  const AppointmentRowMenu({super.key, required this.item});

  final AppointmentListItem item;

  static const String _actionReschedule = 'reschedule';
  static const String _actionCancel = 'cancel';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert_rounded),
      onSelected: (value) => value == _actionReschedule
          ? AppointmentRowActions.reschedule(context, item)
          : AppointmentRowActions.cancel(context, item),
      itemBuilder: (_) => [
        PopupMenuItem(
          value: _actionReschedule,
          child: Text('appointment_row.reschedule'.tr()),
        ),
        PopupMenuItem(
          value: _actionCancel,
          child: Text('appointment_row.cancel'.tr()),
        ),
      ],
    );
  }
}
