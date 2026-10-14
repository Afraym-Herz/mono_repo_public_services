import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:core/src/routing/routes.dart';
import 'package:core/src/routing/animation_route.dart';
import 'package:core/src/routing/error_page.dart';
import 'package:core/src/routing/navigation_service.dart';
import 'package:core/src/routing/placeholder_screen.dart';
import 'package:core/src/routing/shell/main_shell_screen.dart';

import 'package:core/src/dependency_injection/setup_locator.dart';
import 'package:core/src/shared_cubits/app_auth_cubit/app_auth_cubit.dart';
import 'package:core/src/routing/go_router_refresh_stream.dart';

/// Shared application router — single source of truth for navigation chrome.
///
/// Decoupled from app features: each app in `apps/*` injects its own
/// screens via [createRouter]. `core` never imports `features/`.
///
/// Example (inside `apps/agreements/lib/app.dart`):
/// ```dart
/// final router = AppRouter.createRouter(
///   loginBuilder: (ctx, state) => const LoginScreen(),
///   homeBuilder: (ctx, state) => const HomeScreen(),
///   extraShellRoutes: [ /* feature GoRoutes */ ],
/// );
/// ```
class AppRouter {
  AppRouter._();

  /// Builds a [GoRouter] wired with core auth redirect + shell chrome.
  ///
  /// - [loginBuilder] / [initialBuilder]: auth screens owned by the app.
  ///   Defaults to a [PlaceholderScreen] so the router works out of the box.
  /// - [homeBuilder]: landing screen inside [MainShellScreen].
  /// - [extraShellRoutes]: feature routes shown inside the shell.
  /// - [extraRoutes]: top-level routes outside the shell (e.g. details).
  static GoRouter createRouter({
    WidgetBuilder? initialBuilder,
    GoRouterWidgetBuilder? loginBuilder,
    GoRouterWidgetBuilder? splashBuilder,
    GoRouterWidgetBuilder? homeBuilder,
    List<RouteBase> extraShellRoutes = const [],
    List<RouteBase> extraRoutes = const [],
  }) {
    return GoRouter(
      navigatorKey: NavigationService.navigatorKey,
      initialLocation: Routes.initial,
      debugLogDiagnostics: true,
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
      routes: [
        GoRoute(
          path: Routes.initial,
          name: 'initial',
          pageBuilder: (context, state) => fadeTransitionPage(
            initialBuilder?.call(context) ??
                (loginBuilder != null
                    ? loginBuilder(context, state)
                    : PlaceholderScreen(title: 'login'.tr())),
          ),
        ),
        GoRoute(
          path: Routes.splash,
          name: 'splash',
          pageBuilder: (context, state) => fadeTransitionPage(
            splashBuilder?.call(context, state) ??
                PlaceholderScreen(title: 'splash'.tr()),
          ),
        ),
        GoRoute(
          path: Routes.login,
          name: 'login',
          pageBuilder: (context, state) => slideTransitionPage(
            loginBuilder?.call(context, state) ??
                PlaceholderScreen(title: 'login'.tr()),
          ),
        ),
        ShellRoute(
          builder: (context, state, child) => MainShellScreen(child: child),
          routes: [
            GoRoute(
              path: Routes.home,
              name: 'home',
              pageBuilder: (context, state) => fadeTransitionPage(
                homeBuilder?.call(context, state) ??
                    PlaceholderScreen(title: 'home'.tr()),
              ),
            ),
            ...extraShellRoutes,
          ],
        ),
        ...extraRoutes,
      ],
    );
  }

  /// Legacy accessor kept for backward compatibility.
  ///
  /// Prefer [createRouter] with app-provided builders.
  /// Lazily builds the default (placeholder) router on first access so
  /// `getIt<AppAuthCubit>()` is only read after `initDependencies()`.
  static GoRouter? _defaultRouter;
  static GoRouter get router => _defaultRouter ??= createRouter();
}
