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
flutter run --target apps/doctor_clinics_app/lib/main.dart -d chrome `
  --web-port=8080 --web-browser-flag=--user-data-dir=C:\flutter-web-profile
# or: cd apps/doctor_clinics_app
#     flutter run -d chrome --web-port=8080 --web-browser-flag=--user-data-dir=C:\flutter-web-profile
```

> **Persisting local data on web (why sign-up kept coming back).**
> The Drift DB (IndexedDB/OPFS) and `flutter_secure_storage` (localStorage) are
> scoped to the page **origin *and* the Chrome profile**. By default
> `flutter run -d chrome` picks a random port *and* launches a throwaway temp
> Chrome profile (`flutter_tools_chrome_device.<random>`) every run — so both are
> wiped and the app looks like a fresh install.
> Pin both to keep data across runs:
> - `--web-port=8080` → stable origin `http://localhost:8080`.
> - `--web-browser-flag=--user-data-dir=<dir>` → stable Chrome profile.
>
> Alternative: `flutter run -d web-server --web-port=8080`, then open
> `http://localhost:8080` in your own browser (uses your real, persistent
> profile). Native targets (Windows/Android/iOS) persist normally.

## Add a feature

1. Create `lib/features/<name>/` per `lib/features/README.md`.
2. If it needs auth backend, implement core's `AuthRepository` and register in `getIt`.
3. Expose its `GoRoute`s and pass via `AppRouter.createRouter(extraShellRoutes: …)` in `lib/app.dart`.
