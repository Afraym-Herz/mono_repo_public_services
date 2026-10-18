import 'package:animate_do/animate_do.dart';
import 'package:core/src/responsive/adaptive_layout.dart';
import 'package:flutter/material.dart';

/// Top-level shell for the desktop clinics app.
///
/// The app targets desktop workstations and docks its own side navigation, so
/// the shell only scopes [AdaptiveLayout] (ScreenUtil) and hosts the page. It
/// deliberately does not add the mobile/tablet app-bar + drawer chrome
/// (`MobileShellLayout`).
class MainShellScreen extends StatelessWidget {
  const MainShellScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 100),
      child: AdaptiveLayout(
        mobileLayout: (context) => child,
        tabletLayout: (context) => child,
        desktopLayout: (context) => child,
      ),
    );
  }
}
