import 'package:flutter/material.dart';
import 'package:agreements/core/responsive/adaptive_layout.dart';
import 'package:agreements/core/routing/shell/mobile_shell_layout.dart';

/// Top-level Shell Screen for the navigation chrome (app bar + drawer).
///
/// Mobile and tablet both render [MobileShellLayout]; add a desktop layout
/// here later if the app grows a desktop target.
class MainShellScreen extends StatelessWidget {
  const MainShellScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => MobileShellLayout(child: child),
      tabletLayout: (context) => MobileShellLayout(child: child),
    );
  }
}
