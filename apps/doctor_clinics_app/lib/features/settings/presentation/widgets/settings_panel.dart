import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/settings/presentation/widgets/settings_panel_header.dart';
import 'package:doctor_clinics_app/features/settings/presentation/widgets/settings_row.dart';

/// Quick-settings card: interface language + light/dark theme.
///
/// Reuses the core widget kit toggles ([LanguageToggleButton],
/// [ThemeToggleButton]) instead of one-off controls.
class SettingsPanel extends StatelessWidget {
  const SettingsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      duration: const Duration(milliseconds: 300),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: Dimensions.SETTINGS_PANEL_MAX_WIDTH,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE.r),
            border: Border.all(color: context.clinicBorder),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowMedium,
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SettingsPanelHeader(),
              Divider(height: 1, thickness: 1, color: context.clinicBorder),
              SettingsRow(
                title: 'settings_language'.tr(),
                subtitle: 'settings_language_hint'.tr(),
                trailing: const LanguageToggleButton(),
              ),
              Divider(height: 1, thickness: 1, color: context.clinicBorder),
              SettingsRow(
                title: 'settings_theme'.tr(),
                subtitle: 'settings_theme_hint'.tr(),
                trailing: const ThemeToggleButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
