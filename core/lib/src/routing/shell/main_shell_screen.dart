import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:core/src/responsive/adaptive_layout.dart';
import 'package:core/src/routing/shell/mobile_shell_layout.dart';

/// Top-level Shell Screen for the navigation chrome (app bar + drawer).
///
/// Mobile and tablet render [MobileShellLayout] (app bar + slide-out drawer).
/// Large screens render the page bare so a docked shell — e.g. the clinics
/// app's own side navigation bar — owns the chrome instead of stacking an app
/// bar on top of it.
class MainShellScreen extends StatelessWidget {
  const MainShellScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 100),
      child: AdaptiveLayout(
        mobileLayout: (context) => MobileShellLayout(child: child),
        tabletLayout: (context) => MobileShellLayout(child: child),
        tabletLargeLayout: (context) => child,
        desktopLayout: (context) => child,
        desktopLargeLayout: (context) => child,
        desktopXLLayout: (context) => child,
      ),
    );
  }
}
