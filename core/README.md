# `core` — shared package for all apps

Import from apps as:

```dart
import 'package:core/core.dart';       // barrel (preferred)
import 'package:core/src/theme/dimensions.dart';  // deep import if needed
```

## Layout (`lib/src/`)

| Folder | Contains |
|---|---|
| `auth/` | `AuthUser` entity + `AuthRepository` contract (implemented per-app) |
| `custom/` | Shared widgets (buttons, fields, dialogs, app bar, …) |
| `dependency_injection/` | `getIt` + `initDependencies()` |
| `errors/` / `usecases/` / `helpers/` | `Failure`, `UseCase`, converters |
| `network/` | `NetworkInfo` |
| `responsive/` | Adaptive layout, breakpoints, extensions |
| `routing/` + `routing/shell/` | `AppRouter.createRouter`, `Routes`, shell chrome |
| `services/` | Secure/Hive/print storage |
| `shared_cubits/` | `ThemeCubit`, `AppAuthCubit`, autovalidate, password visibility |
| `theme/` | `AppColors`, `AppColorSchemes`, `ThemeManager`, dimensions |
| `utils/` | Constants, validators, logger, styles, typedefs |

## Rules

- No imports from `apps/*` or any `features/` folder. Ever.
- New shared code → add under `lib/src/` + export from `lib/core.dart`.
- Freezed models: run `melos run build_runner:core` (or
  `cd core; dart run build_runner build --delete-conflicting-outputs`).
