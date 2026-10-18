import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/navigation/presentation/widgets/side_nav_bar.dart';

/// Docked desktop shell: workspace canvas + fixed side navigation.
///
/// The clinics app is desktop-only, so the [SideNavBar] is always docked on
/// the leading edge of the canvas.
class AppShellLayout extends StatelessWidget {
  const AppShellLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SideNavBar(),
        Expanded(child: child),
      ],
    );
  }
}
