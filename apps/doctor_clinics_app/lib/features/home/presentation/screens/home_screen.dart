import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/home/presentation/widgets/home_dashboard.dart';
import 'package:doctor_clinics_app/features/navigation/presentation/layouts/app_shell_layout.dart';

/// Home (الرئيسية) screen: docked side navigation + dashboard canvas.
///
/// The canvas hosts the greeting header and appointments alert under the shared
/// top bar; the remaining cards are still placeholders.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShellLayout(
      child: Scaffold(
        backgroundColor: context.clinicBackground,
        body: const HomeDashboard(),
      ),
    );
  }
}
