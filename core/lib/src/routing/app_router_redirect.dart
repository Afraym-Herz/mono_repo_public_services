import 'package:core/src/dependency_injection/setup_locator.dart';
import 'package:core/src/routing/routes.dart';
import 'package:core/src/shared_cubits/app_auth_cubit/app_auth_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Auth redirect used by [AppRouter.createRouter] (see `app_router.dart`).
String? appAuthRedirect(BuildContext context, GoRouterState state) {
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
}
