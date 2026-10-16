import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/centered_panel.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/first_run_panel.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_panel_body.dart';

/// First-run wizard that creates the initial admin user.
///
/// Standalone full-screen route for setup flows; the embedded login-page
/// variant is swapped in by [LoginPanel] on [AuthState.firstRun].
class FirstRunScreen extends StatelessWidget {
  const FirstRunScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>()..checkAuthStatus(),
      child: Scaffold(
        backgroundColor: context.clinicBackground,
        body: AdaptiveLayout(
          mobileLayout: (_) => const _FirstRunBody(),
          tabletLayout: (_) => const _FirstRunBody(),
          desktopLayout: (_) => const _FirstRunBody(),
        ),
      ),
    );
  }
}

/// Shows the setup form on first run, the login form once users exist.
class _FirstRunBody extends StatelessWidget {
  const _FirstRunBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          firstRun: () => const CenteredPanel(child: FirstRunPanel()),
          orElse: () => const LoginPanelBody(),
        );
      },
    );
  }
}
