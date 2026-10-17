import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// One entry in the primary (right-hand) navigation pane.
class SideNavDestination {
  const SideNavDestination({
    required this.labelKey,
    required this.icon,
    required this.activeIcon,
    required this.route,
  });

  /// Translation key resolved with `tr()` at render time.
  final String labelKey;

  /// Outlined icon shown while the entry is idle.
  final IconData icon;

  /// Filled icon shown while the entry is the active route.
  final IconData activeIcon;

  /// Target route (see [Routes]); the entry stays active for nested paths too.
  final String route;

  /// Whether [location] (`GoRouterState.uri.path`) falls under this entry.
  bool isActive(String location) =>
      location == route || location.startsWith('$route/');
}

/// Primary navigation order, top to bottom.
const List<SideNavDestination> sideNavDestinations = [
  SideNavDestination(
    labelKey: 'home',
    icon: Icons.home_outlined,
    activeIcon: Icons.home_rounded,
    route: Routes.home,
  ),
  SideNavDestination(
    labelKey: 'nav_queue',
    icon: Icons.list_alt_outlined,
    activeIcon: Icons.list_alt_rounded,
    route: Routes.queue,
  ),
  SideNavDestination(
    labelKey: 'nav_appointments',
    icon: Icons.calendar_month_outlined,
    activeIcon: Icons.calendar_month_rounded,
    route: Routes.appointments,
  ),
  SideNavDestination(
    labelKey: 'nav_patients',
    icon: Icons.people_alt_outlined,
    activeIcon: Icons.people_alt_rounded,
    route: Routes.patients,
  ),
  SideNavDestination(
    labelKey: 'nav_operations',
    icon: Icons.assignment_outlined,
    activeIcon: Icons.assignment_rounded,
    route: Routes.operations,
  ),
  SideNavDestination(
    labelKey: 'nav_accounts',
    icon: Icons.account_balance_wallet_outlined,
    activeIcon: Icons.account_balance_wallet_rounded,
    route: Routes.billing,
  ),
];
