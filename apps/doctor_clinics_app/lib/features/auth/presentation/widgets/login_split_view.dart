import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/auth/presentation/widgets/empty_branding_placeholder.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_panel.dart';

/// Wide-canvas auth layout: panel (start side, 1/3) + reserved empty space.
class LoginSplitView extends StatelessWidget {
  const LoginSplitView({super.key});

  @override
  Widget build(BuildContext context) {
    // RTL: the first child renders on the RIGHT (start side).
    return const Row(
      children: [
        Expanded(flex: 1, child: LoginPanel()),
        Expanded(flex: 2, child: EmptyBrandingPlaceholder()),
      ],
    );
  }
}
