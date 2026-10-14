# Monorepo — shared `core` + N apps

Flutter monorepo. One shared package, many thin apps:

```text
monoRepo/
  core/                       # package:core — ALL reusable code lives here
    lib/core.dart             # barrel — apps import this (or package:core/src/… deep)
    lib/src/auth/             # AuthUser entity + AuthRepository contract
    lib/src/custom/           # shared widget kit (AppButton, AppTextField, …)
    lib/src/dependency_injection/  # getIt + initDependencies()
    lib/src/errors/           # Failure, ServerFailure, CacheFailure, …
    lib/src/helpers/          # date_converter, …
    lib/src/network/          # NetworkInfo / NetworkInfoImpl
    lib/src/responsive/       # AdaptiveLayout, breakpoints, ResponsiveContext, …
    lib/src/routing/          # AppRouter.createRouter, Routes, shell chrome
    lib/src/services/         # SecureStorage, HiveStorage, PrintService
    lib/src/shared_cubits/    # ThemeCubit, AppAuthCubit, autovalidate, password-visibility
    lib/src/theme/            # AppColors, AppColorSchemes, ThemeManager, Dimensions
    lib/src/usecases/         # UseCase<T, Params>, NoParams
    lib/src/utils/            # AppConstants, validators, logger, styles, typedefs
  apps/<app>/                 # one folder per app — thin runners, NO shared code
    lib/main.dart             # bootstrap: EasyLocalization + initDependencies + runApp
    lib/app.dart              # MaterialApp.router on core cubits + AppRouter
    lib/features/<feature>/   # APP-OWNED features (data/domain/presentation)
    assets/translations/      # en.json + ar.json per app
    android/ ios/ …           # platform runners per app
  melos.yaml                  # workspace tasks
  tool/create_app.ps1         # scaffolds apps/<name>
```

## 0. Offline-only MVP (current status)

All apps are **offline-only** for the MVP. Everything internet-related is
**commented out, not deleted** — search `MVP-OFFLINE` to find every spot:

- `core/lib/src/network/network_info.dart` — whole file in a block comment.
- `core/lib/src/dependency_injection/setup_locator.dart` — connectivity
  registration + `connectivity_plus` / `internet_connection_checker` imports.
- `core/lib/core.dart` — `network_info` barrel export.
- `core/pubspec.yaml` — `firebase_*`, `connectivity_plus`,
  `internet_connection_checker` deps.
- `apps/<app>/lib/main.dart` + `pubspec.yaml` — `Firebase.initializeApp()` + `firebase_core`.

To go online: uncomment all `MVP-OFFLINE` spots, `flutter pub get`, `flutter analyze`.
Do NOT add new internet-dependent code (remote datasources, Firebase calls,
connectivity gating) until the MVP constraint is lifted.

## Golden rules (apply to every app)

1. `core` never imports `apps/*` or any `features/` folder. It exposes abstractions; apps implement them.
2. Apps import shared code only via `package:core/…`. Apps never import each other. Never copy a `core` file into an app — extend `core` instead.
3. Auth: `core` owns `AuthUser` + `AuthRepository` contract + `AppAuthCubit`. Each app's auth feature implements `AuthRepository`, registers it in `getIt`, and maps its own user model to/from `AuthUser`.
4. Router: `AppRouter.createRouter(loginBuilder:…, homeBuilder:…, extraShellRoutes:…, extraRoutes:…)` in the app's `app.dart`. Feature routes go inside the shell. Navigate with `context.go()`/`context.push()` — never `Navigator.of(context)` (except popping dialogs).

## Commands (run from the package folder, or via melos from root)

```bash
melos bootstrap                                          # install all packages
cd core && flutter pub get                               # single package
dart run build_runner build --delete-conflicting-outputs # after editing any @freezed class (core)
flutter analyze                                          # must be clean before calling a change done
powershell -ExecutionPolicy Bypass -File tool/create_app.ps1 -AppName my_app
```

New `.tr()` key → update **both** `apps/<app>/assets/translations/en.json` and `ar.json` in the same change, or the string silently renders as the raw key.

## 1. App bootstrap pattern (every `apps/<app>/lib/main.dart`)

`WidgetsFlutterBinding.ensureInitialized()` → `EasyLocalization.ensureInitialized()` → `Bloc.observer = SimpleBlocObserver()` → (optional `Firebase.initializeApp()` in try/catch) → `await initDependencies()` → `await getIt<AppAuthCubit>().checkAuthStatus()` → `runApp(EasyLocalization(…))`. `app.dart` wraps in `MultiBlocProvider` (`ThemeCubit`, `AppAuthCubit`), calls `ThemeManager.setDarkMode(themeState.darkTheme)` per build, and drives `MaterialApp.router` (`AppColorSchemes.light/dark`) from `AppRouter.createRouter(…)`.

## 2. Responsive

`MainShellScreen` renders `MobileShellLayout` for mobile + tablet via `AdaptiveLayout`. Never write manual width checks — use `ResponsiveContext` (`package:core/src/responsive/responsive_extensions.dart`): `context.isMobileOrSmallTablet`, `context.isLargeTabletOrDesktop`, `context.responsive<T>(mobile:…, tablet:…, desktop:…, defaultValue:…)`, `context.gridColumns`, `context.contentMaxWidth`. Breakpoints: mobile <600, tablet ≥1200, desktop ≥1600 (`ResponsiveBreakpoints`).

## 3. Feature layering (`apps/<app>/lib/features/<feature>/`)

- **`domain/`** — pure Dart. `entities/`, abstract `repositories/` (implement core contracts like `AuthRepository` here), `usecases/` extending `UseCase<T, Params>` returning `FutureResult<T>` (`Future<Either<Failure, T>>`).
- **`data/`** — `datasources/` (remote = Firestore/`firebase_auth`, local = Hive/`SecureStorageService`), `models/` (`@freezed`, `toDomain()`), concrete `repositories/` — catch every `FirebaseException` here and return `FutureResult<T>`. No backend exception reaches `presentation/`.
- **`presentation/`** — `cubit/` (one focused Cubit per flow, never a God Cubit), `screens/` (delegate to `AdaptiveLayout`), `widgets/` (`StatelessWidget`, <80 lines).

## 4. Coding standards

- Max 100 lines for Dart logic files, 80 for UI widget files. Split into `presentation/widgets/` or `helpers/` instead of growing a file.
- Widgets are classes, not methods: always `StatelessWidget`, never a `Widget _buildXxx()` helper.
- No `setState()` — state goes through a Cubit, including scoped/internal state (e.g. `AppTextField` owns a `PasswordVisibilityCubit` via an internal `BlocProvider`).
- `@freezed` for every `data/models/` class and every `presentation/cubit/` state (`.initial()`, `.loading()`, `.success(data)`, `.error()`).
- Route transitions come from `animation_route.dart` (`fadeTransitionPage`, `slideTransitionPage`, `scaleTransitionPage`, `transparentModalRoutePage`, …).

## 5. Design system (core)

- No hardcoded hex colors — `AppColors` / `BuildContext` extensions in `color_extensions.dart`.
- No hardcoded sizes — `Dimensions`.
- Wrap UI entrances in `animate_do` transitions (`FadeInUp`, `ZoomIn`, …) with staggered `delay:`.
- Shared widget kit in `core/lib/src/custom/` (`AppButton`, `AppTextField`, `AppDropdownField`, `AppSnackBar`, `AppSectionCard`, `AppFeatureHeader`, …) — check there before writing a one-off widget.
- Modal/detail screens use `transparentModalRoutePage(...)`, not `showDialog`, so the parent stays visible behind modals on large screens.

## Don't

No tests unless asked. No magic strings for status/collection/field names. No skipping the `ar.json`/`en.json` pair when adding a `.tr()` key. No search UI without a 500ms debounce + `isSearching` flag (swapping the list for a skeleton on every keystroke loses scroll/text state).
