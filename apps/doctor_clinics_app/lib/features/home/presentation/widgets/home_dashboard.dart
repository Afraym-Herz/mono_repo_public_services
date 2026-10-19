import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/home/presentation/widgets/home_appointments_alert.dart';
import 'package:doctor_clinics_app/features/home/presentation/widgets/home_greeting_header.dart';
import 'package:doctor_clinics_app/features/home/presentation/widgets/home_sections_row.dart';
import 'package:doctor_clinics_app/features/home/presentation/widgets/home_stats_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Home dashboard canvas rendered inside the workspace shell.
///
/// The whole canvas scrolls: greeting, appointments alert and KPI strip stack
/// above the two-column section area that hosts the live queue.
class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HomeGreetingHeader(),
          const HomeAppointmentsAlert(),
          SizedBox(height: 20.h),
          const HomeStatsRow(),
          const HomeSectionsRow(),
        ],
      ),
    );
  }
}
