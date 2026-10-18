import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Plain `Ctrl+K` text affordance hinting the (future) global search shortcut.
class TopBarShortcutHint extends StatelessWidget {
  const TopBarShortcutHint({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveText(
      'top_bar_search_shortcut'.tr(),
      fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
      responsive: false,
      color: context.clinicTextSecondary,
    );
  }
}
