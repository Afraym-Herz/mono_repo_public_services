import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/home/presentation/widgets/home_appointments_alert.dart';
import 'package:doctor_clinics_app/features/home/presentation/widgets/home_greeting_header.dart';
import 'package:doctor_clinics_app/features/home/presentation/widgets/home_placeholder.dart';
import 'package:doctor_clinics_app/features/home/presentation/widgets/home_stats_row.dart';

/// Home dashboard canvas rendered inside the workspace shell.
///
/// The greeting header and appointments alert dock directly under the top bar,
/// followed by the KPI strip; the remaining canvas is still a placeholder until
/// the rest of the dashboard is built.
class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HomeGreetingHeader(),
        HomeAppointmentsAlert(),
        HomeStatsRow(),
        Expanded(child: HomePlaceholder()),
      ],
    );
  }
}
