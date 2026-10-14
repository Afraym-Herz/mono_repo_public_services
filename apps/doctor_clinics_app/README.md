# Doctor Clinics (app)

Doctor Clinics app in the monorepo. Thin runner — all reusable code lives in `package:core`.

## Structure

```text
apps/doctor_clinics_app/
  lib/
    main.dart        # bootstrap: Firebase + EasyLocalization + initDependencies
    app.dart         # MaterialApp.router wired to core cubits + AppRouter
    features/        # APP-OWNED features (auth, clinics, …) — see lib/features/README.md
  assets/translations/  # en.json + ar.json
  android/ ios/ linux/ macos/ web/ windows/
  pubspec.yaml       # depends on core via path: ../../core
```

## Run

```powershell
melos bootstrap
flutter run --target apps/doctor_clinics_app/lib/main.dart -d chrome
# or: cd apps/doctor_clinics_app; flutter run
```

## Add a feature

1. Create `lib/features/<name>/` per `lib/features/README.md`.
2. If it needs auth backend, implement core's `AuthRepository` and register in `getIt`.
3. Expose its `GoRoute`s and pass via `AppRouter.createRouter(extraShellRoutes: …)` in `lib/app.dart`.
