import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:core/core.dart';
import 'package:doctor_clinics_app/core/routing/app_shell_routes.dart';
import 'package:doctor_clinics_app/features/auth/presentation/screens/login_screen.dart';
import 'package:doctor_clinics_app/features/billing/presentation/billing_routes.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/expenses_routes.dart';
import 'package:doctor_clinics_app/features/home/presentation/screens/home_screen.dart';
import 'package:doctor_clinics_app/features/operations/presentation/operation_routes.dart';
import 'package:doctor_clinics_app/features/patients/presentation/patient_routes.dart';
import 'package:doctor_clinics_app/features/settings/presentation/settings_routes.dart';

/// Root widget for the Doctor Clinics app.
///
/// Wires shared `core` cubits + router. App screens are injected into
/// [AppRouter.createRouter] — add real feature screens and pass their
/// builders here as they are built under `lib/features/`.
class DoctorClinicsApp extends StatefulWidget {
  const DoctorClinicsApp({super.key});

  @override
  State<DoctorClinicsApp> createState() => _DoctorClinicsAppState();
}

class _DoctorClinicsAppState extends State<DoctorClinicsApp> {
  /// Hoisted so theme changes rebuild only `MaterialApp.router`, not the
  /// navigation state. Feature routes stay inside the shell.
  late final router = AppRouter.createRouter(
    loginBuilder: (ctx, state) => const LoginScreen(),
    homeBuilder: (ctx, state) => const HomeScreen(),
    extraShellRoutes: buildAppShellRoutes(),
    extraRoutes: [
      ...buildSettingsRoutes(),
      ...buildPatientRoutes(),
      ...buildOperationRoutes(),
      ...buildBillingRoutes(),
      ...buildExpensesRoutes(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<ThemeCubit>()),
        BlocProvider.value(value: getIt<AppAuthCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          ThemeManager.setDarkMode(themeState.darkTheme);
          return ScreenUtilInit(
            // Desktop-first app: scale from the 1440x900 clinical canvas so
            // widgets rendered outside AdaptiveLayout (modals, dialogs,
            // snack bars) never balloon on wide screens.
            designSize: ResponsiveDesignSizes.desktop,
            minTextAdapt: true,
            builder: (context, child) => MaterialApp.router(
              title: 'Doctor Clinics',
              debugShowCheckedModeBanner: false,
              theme: AppColorSchemes.light,
              darkTheme: AppColorSchemes.dark,
              themeMode: themeState.darkTheme
                  ? ThemeMode.dark
                  : ThemeMode.light,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              routerConfig: router,
            ),
          );
        },
      ),
    );
  }
}
