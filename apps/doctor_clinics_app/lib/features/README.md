# `lib/features/` (app-owned, NOT shared)

Each app owns its features. `core` must never import from here.

Recommended per-feature layout (clean architecture):

```text
features/
  auth/
    data/
      datasources/
      models/
      repositories/
    domain/
      entities/
      repositories/   # implements core's AuthRepository
      usecases/
    presentation/
      cubits/
      screens/
      widgets/
```

Rules:
1. Shared UI / theme / routing / services / cubits → `package:core`, not copied here.
2. Implement `AuthRepository` from `package:core` and register it in `getIt`
   (e.g. inside `lib/features/auth/auth_injection.dart`) so core widgets
   like `HeaderLogoutButton` keep working.
3. Register feature routes via `AppRouter.createRouter(extraShellRoutes: [...])`
   in `lib/app.dart` — do not fork `core`'s router.
