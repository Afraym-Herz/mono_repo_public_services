import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/navigation/presentation/models/side_nav_destination.dart';
import 'package:doctor_clinics_app/features/navigation/presentation/widgets/side_nav_header.dart';
import 'package:doctor_clinics_app/features/navigation/presentation/widgets/side_nav_item.dart';
import 'package:doctor_clinics_app/features/navigation/presentation/widgets/side_nav_version_badge.dart';

/// Fixed primary navigation pane docked to the leading edge of the layout.
///
/// Matches DESIGN (2).md: a 240px right-hand pane holding the clinic identity,
/// the primary destinations, and the app version.
class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    return Container(
      width: Dimensions.SIDE_NAV_WIDTH,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: BorderDirectional(end: BorderSide(color: context.clinicBorder)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SideNavHeader(),
            Divider(height: 1, thickness: 1, color: context.clinicBorder),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.PADDING_SIZE_SMALL.h,
                ),
                children: [
                  for (final destination in sideNavDestinations)
                    SideNavItem(
                      destination: destination,
                      isActive: destination.isActive(location),
                    ),
                ],
              ),
            ),
            const SideNavVersionBadge(),
          ],
        ),
      ),
    );
  }
}
