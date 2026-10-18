# Flutter Monorepo — shared `core` + apps

```text
monoRepo/
  core/                    # SHARED package (name: core) — theme, routing/shell,
                           # services, network, shared cubits, custom widgets, utils
    lib/
      core.dart            # single barrel import for apps
      src/
        auth/              # AuthUser + AuthRepository contracts (no feature deps)
        custom/ responsive/ routing/ services/ shared_cubits/ theme/ …
    pubspec.yaml
  apps/
    doctor_clinics_app/    # Doctor Clinics app (android/ ios/ … runners)
      lib/
        main.dart          # bootstrap: Firebase + EasyLocalization + initDependencies
        app.dart           # MaterialApp.router on core cubits + AppRouter
        features/          # APP-OWNED features only (see lib/features/README.md)
      assets/translations/ # en.json + ar.json
      pubspec.yaml         # core: path: ../../core
  melos.yaml               # workspace tasks (bootstrap / analyze / test / run)
  tool/create_app.ps1      # scaffolds a new app in apps/<name>
  analysis_options.yaml    # root lints, included by every package
  CLAUDE.md                # working rules for all apps (read first)
```

## Architecture rules

1. `core` never imports `apps/*` or `features/`. It exposes abstractions
   (`AuthRepository`, `AuthUser`, `AppRouter.createRouter`, cubits, theme).
2. Apps import shared code only via `package:core/...`. Apps never import
   each other.
3. Features live in `apps/<app>/lib/features/<feature>/{data,domain,presentation}/`
   and are injected into core's shell (`extraShellRoutes`, `loginBuilder`, …).

## Getting started

```powershell
dart pub global activate melos
melos bootstrap
flutter run --target apps/doctor_clinics_app/lib/main.dart -d chrome `
  --web-port=8080 --web-browser-flag=--user-data-dir=C:\flutter-web-profile
```

## New app

```powershell
powershell -ExecutionPolicy Bypass -File tool/create_app.ps1 -AppName my_app
```
