import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/navigation/presentation/widgets/side_nav_item.dart';

/// Side-nav shortcut that opens the quick-settings modal (language + theme).
///
/// Pushed as a modal route (`transparentModalRoutePage`) so the current page
/// stays visible behind it (CLAUDE.md §5).
class SideNavSettingsShortcut extends StatelessWidget {
  const SideNavSettingsShortcut({super.key});

  @override
  Widget build(BuildContext context) {
    return SideNavItem(
      icon: Icons.settings_outlined,
      activeIcon: Icons.settings_rounded,
      label: 'settings_title'.tr(),
      onTap: () => context.push(Routes.settings),
    );
  }
}
