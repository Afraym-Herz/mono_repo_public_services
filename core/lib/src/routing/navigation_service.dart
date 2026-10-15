// lib/core/services/navigation_service.dart
import 'package:flutter/material.dart';

/// Holds the root [navigatorKey] consumed by `GoRouter`.
///
/// Navigation itself must go through `context.go()` / `context.push()` with
/// [AppRouter.createRouter] — never the imperative helpers below.
/// The push/pop helpers are kept only for legacy callers (e.g. dialog pops)
/// and are deprecated for route navigation.
class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;
  NavigationService._internal();

  // Global navigator key للتطبيق الأساسي
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // Stack للـ nested navigators
  static final Map<String, GlobalKey<NavigatorState>> _nestedNavigators = {};

  // تسجيل nested navigator جديد
  static void registerNestedNavigator(String name) {
    if (!_nestedNavigators.containsKey(name)) {
      _nestedNavigators[name] = GlobalKey<NavigatorState>();
    }
  }

  // الحصول على nested navigator key
  static GlobalKey<NavigatorState>? getNestedNavigatorKey(String name) {
    return _nestedNavigators[name];
  }

  // إزالة nested navigator (عند dispose)
  static void unregisterNestedNavigator(String name) {
    _nestedNavigators.remove(name);
  }

  // Navigation methods for global context.
  //
  // Deprecated: navigate via context.go()/push() + AppRouter.createRouter.
  // Kept for legacy dialog-pop callers only.
  @Deprecated('Use context.go()/push() with AppRouter.createRouter instead')
  static Future<T?>? pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  @Deprecated('Use context.go()/push() with AppRouter.createRouter instead')
  static Future<T?>? pushReplacementNamed<
    T extends Object?,
    TO extends Object?
  >(String routeName, {Object? arguments, TO? result}) {
    return navigatorKey.currentState?.pushReplacementNamed<T, TO>(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  static void pop<T extends Object?>([T? result]) {
    return navigatorKey.currentState?.pop<T>(result);
  }

  @Deprecated('Use context.go()/push() with AppRouter.createRouter instead')
  static void popUntil(bool Function(Route<dynamic>) predicate) {
    return navigatorKey.currentState?.popUntil(predicate);
  }

  // Nested navigation methods.
  //
  // Deprecated for the same reason — prefer go_router shell branches.
  @Deprecated('Use context.go()/push() with AppRouter.createRouter instead')
  static Future<T?>? pushNamedInNested<T extends Object?>(
    String navigatorName,
    String routeName, {
    Object? arguments,
  }) {
    final navigator = _nestedNavigators[navigatorName];
    return navigator?.currentState?.pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  static void popInNested(String navigatorName, [Object? result]) {
    final navigator = _nestedNavigators[navigatorName];
    return navigator?.currentState?.pop(result);
  }

  @Deprecated('Use context.go()/push() with AppRouter.createRouter instead')
  static void popUntilInNested(
    String navigatorName,
    bool Function(Route<dynamic>) predicate,
  ) {
    final navigator = _nestedNavigators[navigatorName];
    return navigator?.currentState?.popUntil(predicate);
  }

  // Get current route name
  static String? getCurrentRouteName(String navigatorName) {
    final navigator = _nestedNavigators[navigatorName];
    return ModalRoute.of(navigator!.currentContext!)?.settings.name;
  }

  // Check if can pop
  static bool canPopInNested(String navigatorName) {
    final navigator = _nestedNavigators[navigatorName];
    return navigator?.currentState?.canPop() ?? false;
  }
}
