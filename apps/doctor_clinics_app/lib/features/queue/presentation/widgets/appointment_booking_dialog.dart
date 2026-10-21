import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_booking_controller.dart';
import 'appointment_booking_view.dart';
import 'appointment_draft.dart';

export 'appointment_draft.dart';

Future<AppointmentDraft?> showAppointmentBookingDialog(
  BuildContext context, {
  DateTime? initialDate,
  bool isWalkIn = false,
}) {
  return showGeneralDialog<AppointmentDraft>(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: AppColors.scrim,
    pageBuilder: (_, _, _) => AppointmentBookingDialog(
      initialDate: initialDate ?? DateTime.now(),
      isWalkIn: isWalkIn,
    ),
  );
}

class AppointmentBookingDialog extends StatefulWidget {
  const AppointmentBookingDialog({
    super.key,
    required this.initialDate,
    this.isWalkIn = false,
  });

  final DateTime initialDate;
  final bool isWalkIn;

  @override
  State<AppointmentBookingDialog> createState() =>
      _AppointmentBookingDialogState();
}

class _AppointmentBookingDialogState extends State<AppointmentBookingDialog> {
  late final AppointmentBookingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AppointmentBookingController(
      initialDate: widget.initialDate,
      isWalkIn: widget.isWalkIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppointmentBookingView(
      controller: _controller,
      onClose: () => Navigator.pop(context),
      onConfirm: _confirm,
    );
  }

  void _confirm(Patient patient) => Navigator.pop(
    context,
    AppointmentDraft.fromController(_controller, patient),
  );
}
