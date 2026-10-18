import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/settings/presentation/widgets/settings_panel.dart';

/// Barrier-backed host for [SettingsPanel].
///
/// Wrapped in [AdaptiveLayout] so it inherits the same ScreenUtil scope as the
/// app screens, and pushed with `transparentModalRoutePage(...)` so the page
/// behind it stays visible.
class SettingsModalScreen extends StatelessWidget {
  const SettingsModalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: AdaptiveLayout(
        mobileLayout: (_) => const _CenteredSettingsPanel(),
        tabletLayout: (_) => const _CenteredSettingsPanel(),
        desktopLayout: (_) => const _CenteredSettingsPanel(),
      ),
    );
  }
}

class _CenteredSettingsPanel extends StatelessWidget {
  const _CenteredSettingsPanel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.r),
        child: const SettingsPanel(),
      ),
    );
  }
}
