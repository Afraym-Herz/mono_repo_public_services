import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/schedule_permissions.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/appointment_header_connected.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/appointment_schedule_view.dart';

class AppointmentBody extends StatelessWidget {
  const AppointmentBody({super.key});

  @override
  Widget build(BuildContext context) {
    final canManage = canManageSchedule();
    return Scaffold(
      backgroundColor: context.clinicBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppointmentHeaderConnected(canManage: canManage),
            Expanded(child: AppointmentScheduleView(canManage: canManage)),
          ],
        ),
      ),
    );
  }
}
