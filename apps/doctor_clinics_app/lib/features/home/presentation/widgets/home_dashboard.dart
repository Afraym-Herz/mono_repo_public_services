import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/home/presentation/widgets/home_appointments_alert.dart';
import 'package:doctor_clinics_app/features/home/presentation/widgets/home_greeting_header.dart';
import 'package:doctor_clinics_app/features/home/presentation/widgets/home_sections_row.dart';
import 'package:doctor_clinics_app/features/home/presentation/widgets/home_stats_row.dart';

/// Home dashboard canvas rendered inside the workspace shell.
///
/// The whole canvas scrolls: greeting, appointments alert and KPI strip stack
/// above the two-column section area that hosts the live queue.
class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HomeGreetingHeader(),
          HomeAppointmentsAlert(),
          HomeStatsRow(),
          HomeSectionsRow(),
        ],
      ),
    );
  }
}
