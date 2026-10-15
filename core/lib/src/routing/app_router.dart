import 'package:core/src/dependency_injection/setup_locator.dart';
import 'package:core/src/routing/app_router_redirect.dart';
import 'package:core/src/routing/app_router_routes.dart';
import 'package:core/src/routing/error_page.dart';
import 'package:core/src/routing/go_router_refresh_stream.dart';
import 'package:core/src/routing/navigation_service.dart';
import 'package:core/src/routing/routes.dart';
import 'package:core/src/shared_cubits/app_auth_cubit/app_auth_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Shared application router — single source of truth for navigation chrome.
///
/// Decoupled from app features: each app in `apps/*` injects its own
/// screens via [createRouter]. `core` never imports `features/`.
class AppRouter {
  AppRouter._();

  /// Builds a [GoRouter] wired with core auth redirect + shell chrome.
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
      redirect: appAuthRedirect,
      routes: buildAppRoutes(
        initialBuilder: initialBuilder,
        loginBuilder: loginBuilder,
        splashBuilder: splashBuilder,
        homeBuilder: homeBuilder,
        extraShellRoutes: extraShellRoutes,
        extraRoutes: extraRoutes,
      ),
    );
  }

  /// Legacy accessor kept for backward compatibility.
  static GoRouter? _defaultRouter;
  static GoRouter get router => _defaultRouter ??= createRouter();
}
