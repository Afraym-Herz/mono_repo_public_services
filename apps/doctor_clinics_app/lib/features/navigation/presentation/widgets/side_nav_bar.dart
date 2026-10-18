import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/navigation/presentation/models/side_nav_destination.dart';
import 'package:doctor_clinics_app/features/navigation/presentation/widgets/side_nav_header.dart';
import 'package:doctor_clinics_app/features/navigation/presentation/widgets/side_nav_item.dart';
import 'package:doctor_clinics_app/features/navigation/presentation/widgets/side_nav_settings_shortcut.dart';
import 'package:doctor_clinics_app/features/navigation/presentation/widgets/side_nav_version_badge.dart';

/// Fixed primary navigation pane docked to the leading edge of the layout.
///
/// Matches DESIGN (2).md: a 240px right-hand pane holding the clinic identity,
/// the primary destinations, a settings shortcut, and the app version.
class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    return Container(
      width: Dimensions.SIDE_NAV_WIDTH.w,
      decoration: BoxDecoration(
        border: BorderDirectional(end: BorderSide(color: context.clinicBorder)),
      ),
      // [Material] is required here: the shell docks this pane OUTSIDE the page
      // `Scaffold`, so nothing else supplies a `DefaultTextStyle`. Without it,
      // text falls back to Flutter's `_errorTextStyle` (yellow double
      // underline) — visible on the header and version badge, whose text is not
      // already wrapped in a `Material` like [SideNavItem] is.
      child: Material(
        color: Theme.of(context).colorScheme.surface,
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
                    for (final (index, destination)
                        in sideNavDestinations.indexed)
                      SideNavItem(
                        icon: destination.icon,
                        activeIcon: destination.activeIcon,
                        label: destination.labelKey.tr(),
                        isActive: destination.isActive(location),
                        onTap: destination.isActive(location)
                            ? null
                            : () => context.go(destination.route),
                        delay: Duration(milliseconds: 60 * index),
                      ),
                  ],
                ),
              ),
              const SideNavSettingsShortcut(),
              const SideNavVersionBadge(),
            ],
          ),
        ),
      ),
    );
  }
}
