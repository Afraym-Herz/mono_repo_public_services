import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_clinics_app/features/auth/presentation/cubit/remember_me_cubit.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_panel.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_split_view.dart';

/// Login entry screen (RTL-first, DESIGN (2).md).
///
/// Wide canvases render the 1/3 auth panel beside the intentionally empty
/// 2/3 branding placeholder; narrow canvases render the panel full-width.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthCubit>()),
        BlocProvider(create: (_) => RememberMeCubit()),
      ],
      child: Scaffold(
        backgroundColor: context.clinicBackground,
        body: AdaptiveLayout(
          mobileLayout: (_) => const LoginPanel(),
          tabletLayout: (_) => const LoginSplitView(),
          desktopLayout: (_) => const LoginSplitView(),
        ),
      ),
    );
  }
}
