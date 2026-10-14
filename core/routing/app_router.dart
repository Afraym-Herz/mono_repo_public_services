import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

import 'package:agreements/core/routing/routes.dart';
import 'package:agreements/core/routing/animation_route.dart';
import 'package:agreements/core/routing/error_page.dart';
import 'package:agreements/core/routing/navigation_service.dart';
import 'package:agreements/core/routing/placeholder_screen.dart';
import 'package:agreements/core/routing/shell/main_shell_screen.dart';
import 'package:agreements/features/auth/presentation/screens/login_screen.dart';

import 'package:agreements/core/dependency_injection/setup_locator.dart';
import 'package:agreements/core/shared_cubits/app_auth_cubit/app_auth_cubit.dart';
import 'package:agreements/core/routing/go_router_refresh_stream.dart';

/// Application router — single source of truth for all navigation.
///
/// Uses [GoRouter] with named routes matching [Routes] constants.
/// Every route uses transition animations from [animation_route.dart].
///
/// `home` is currently a [PlaceholderScreen] — swap it for the app's real
/// landing screen once it exists, and add feature routes the same way.
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: Routes.initial,
    debugLogDiagnostics: true,
    routes: _routes,
    refreshListenable: GoRouterRefreshStream(getIt<AppAuthCubit>().stream),
    errorBuilder: (context, state) => ErrorPage(error: state.error),
    redirect: (context, state) {
      final authState = getIt<AppAuthCubit>().state;

      final isAuthPath =
          state.uri.path == Routes.login || state.uri.path == Routes.initial;

      return authState.maybeWhen(
        initial: () {
          // Still checking stored auth — stay on the initial/splash route.
          return state.uri.path == Routes.initial ? null : Routes.initial;
        },
        unauthenticated: () {
          return !isAuthPath ? Routes.login : null;
        },
        authenticated: (user) {
          return isAuthPath ? Routes.home : null;
        },
        orElse: () => null,
      );
    },
  );

  static final List<RouteBase> _routes = [
    GoRoute(
      path: Routes.initial,
      name: 'initial',
      pageBuilder: (context, state) => fadeTransitionPage(const LoginScreen()),
    ),
    GoRoute(
      path: Routes.splash,
      name: 'splash',
      pageBuilder: (context, state) =>
          fadeTransitionPage(PlaceholderScreen(title: 'splash'.tr())),
    ),
    GoRoute(
      path: Routes.login,
      name: 'login',
      pageBuilder: (context, state) => slideTransitionPage(const LoginScreen()),
    ),
    ShellRoute(
      builder: (context, state, child) => MainShellScreen(child: child),
      routes: [
        GoRoute(
          path: Routes.home,
          name: 'home',
          pageBuilder: (context, state) =>
              fadeTransitionPage(PlaceholderScreen(title: 'home'.tr())),
        ),
      ],
    ),
  ];
}
