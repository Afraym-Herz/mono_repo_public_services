import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/navigation/presentation/widgets/side_nav_bar.dart';
import 'package:doctor_clinics_app/features/navigation/presentation/widgets/top_bar.dart';

/// Docked desktop shell: workspace canvas + fixed side navigation.
///
/// The clinics app is desktop-only, so the [SideNavBar] is always docked on the
/// leading edge (right edge in RTL) and every shell tab shares one [TopBar].
///
/// This widget owns a root [Scaffold] on purpose: the chrome it docks
/// ([SideNavBar], [TopBar]) sits OUTSIDE the routed page's own `Scaffold`, so
/// nothing else would supply the [Material] ancestor and [DefaultTextStyle]
/// they need. Without this Scaffold, chrome text falls back to Flutter's error
/// text style (yellow double underline) and material widgets such as the
/// top-bar search field throw "No Material widget found".
class AppShellLayout extends StatelessWidget {
  const AppShellLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.clinicBackground,
      body: Row(
        children: [
          const SideNavBar(),
          Expanded(
            child: Column(
              children: [
                const TopBar(),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
