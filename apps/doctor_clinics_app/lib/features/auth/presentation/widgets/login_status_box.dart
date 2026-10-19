import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_status_content.dart';

/// Offline status strip reflecting the real auth/DB state (MVP-OFFLINE:
/// local DB readiness, never cloud).
///
/// - checking (initial/loading) → spinner + "connecting" message
/// - first run → setup prompt instead of a misleading "ready"
/// - error → error icon + message instead of a misleading "ready"
class LoginStatusBox extends StatelessWidget {
  const LoginStatusBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return LoginStatusContent(
          isChecking: state.maybeWhen(
            initial: () => true,
            loading: () => true,
            orElse: () => false,
          ),
          isSetup: state.maybeWhen(
            firstRun: () => true,
            orElse: () => false,
          ),
          hasError: state.maybeWhen(
            error: (_) => true,
            orElse: () => false,
          ),
        );
      },
    );
  }
}
