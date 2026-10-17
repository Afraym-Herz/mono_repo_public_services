import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/navigation/presentation/widgets/side_nav_bar.dart';

/// Docked app shell: workspace canvas + fixed side navigation.
///
/// On large screens it docks the [SideNavBar] on the leading edge next to the
/// page. On compact widths it defers to the page alone — the core shell
/// (`MobileShellLayout`) supplies the app bar + slide-out drawer there.
class AppShellLayout extends StatelessWidget {
  const AppShellLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!context.isLargeTabletOrDesktop) return child;
    return Row(
      children: [
        const SideNavBar(),
        Expanded(child: child),
      ],
    );
  }
}
