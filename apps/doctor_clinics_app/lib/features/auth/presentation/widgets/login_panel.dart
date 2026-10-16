import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/centered_panel.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/first_run_panel.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_panel_body.dart';

/// Auth entry panel: login form, first-run setup, or a loading indicator.
///
/// [LoginScreen] triggers [AuthCubit.checkAuthStatus] on creation. A fresh
/// database (e.g. a new web profile with zero users) yields
/// [AuthState.firstRun], which swaps the login form for the initial-admin
/// setup form instead of failing every login attempt.
class LoginPanel extends StatelessWidget {
  const LoginPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (prev, curr) => curr.maybeWhen(
        error: (_) => true,
        firstRun: () => true,
        orElse: () => false,
      ),
      listener: (context, state) {
        state.whenOrNull(
          error: (message) => AppSnackBar.showError(
            context,
            message.isEmpty ? 'login_error_generic'.tr() : message,
          ),
          firstRun: () => AppSnackBar.showInfo(context, 'login_first_run'.tr()),
        );
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            firstRun: () => const CenteredPanel(child: FirstRunPanel()),
            authenticated: (_) => const SizedBox.shrink(),
            orElse: () => const LoginPanelBody(),
          );
        },
      ),
    );
  }
}
