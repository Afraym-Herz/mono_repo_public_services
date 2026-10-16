import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/auth/presentation/widgets/branding_panel.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_panel.dart';

/// Wide-canvas auth layout: panel pinned RIGHT, branding fills the rest.
///
/// Children are ordered per locale because [Row] follows the ambient
/// direction: RTL lays out right-to-left, LTR left-to-right.
class LoginSplitView extends StatelessWidget {
  const LoginSplitView({super.key});

  @override
  Widget build(BuildContext context) {
    const panel = Expanded(flex: 1, child: LoginPanel());
    const branding = Expanded(flex: 2, child: BrandingPanel());
    final isRtl = context.locale.languageCode == 'ar';
    return Row(children: isRtl ? [panel, branding] : [branding, panel]);
  }
}
