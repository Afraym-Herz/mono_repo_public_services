import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/home/presentation/widgets/home_placeholder.dart';
import 'package:doctor_clinics_app/features/navigation/presentation/layouts/app_shell_layout.dart';

/// Home (الرئيسية) screen: docked side navigation + dashboard canvas.
///
/// The canvas is a placeholder for now — only the navigation shell is built.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShellLayout(
      child: Scaffold(
        backgroundColor: context.clinicBackground,
        body: const HomePlaceholder(),
      ),
    );
  }
}
