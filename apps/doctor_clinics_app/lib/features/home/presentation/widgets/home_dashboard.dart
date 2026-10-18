import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/home/presentation/widgets/home_appointments_alert.dart';
import 'package:doctor_clinics_app/features/home/presentation/widgets/home_greeting_header.dart';
import 'package:doctor_clinics_app/features/home/presentation/widgets/home_placeholder.dart';

/// Home dashboard canvas rendered inside the workspace shell.
///
/// The greeting header and appointments alert dock directly under the top bar;
/// the remaining canvas is still a placeholder until the dashboard cards are
/// built.
class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HomeGreetingHeader(),
        HomeAppointmentsAlert(),
        Expanded(child: HomePlaceholder()),
      ],
    );
  }
}
