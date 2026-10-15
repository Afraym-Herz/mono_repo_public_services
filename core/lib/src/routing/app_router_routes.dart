import 'package:core/src/routing/animation_route.dart';
import 'package:core/src/routing/placeholder_screen.dart';
import 'package:core/src/routing/routes.dart';
import 'package:core/src/routing/shell/main_shell_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Route table used by [AppRouter.createRouter] (see `app_router.dart`).
List<RouteBase> buildAppRoutes({
  WidgetBuilder? initialBuilder,
  GoRouterWidgetBuilder? loginBuilder,
  GoRouterWidgetBuilder? splashBuilder,
  GoRouterWidgetBuilder? homeBuilder,
  List<RouteBase> extraShellRoutes = const [],
  List<RouteBase> extraRoutes = const [],
}) {
  return [
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
  ];
}
