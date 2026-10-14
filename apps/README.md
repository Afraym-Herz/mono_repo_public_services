# apps/

One folder per Flutter application. All apps share `package:core` (`../../core`).

| Folder | Purpose |
|---|---|
| `doctor_clinics_app/` | Doctor Clinics app (has `android/ ios/ …` runners). |

## Add a new app

```powershell
powershell -ExecutionPolicy Bypass -File tool/create_app.ps1 -AppName my_new_app
```

The script runs `flutter create` for runners and writes template `lib/`,
`pubspec.yaml`, `analysis_options.yaml`, and `assets/translations/` wired
to `package:core`.

## Conventions

- App package name == folder name (`name: doctor_clinics_app`).
- Import shared code only via `package:core/...` or `package:core/core.dart`.
- Never import `package:<other_app>/…` — apps never depend on each other.
- Feature code: `apps/<app>/lib/features/<feature>/{data,domain,presentation}/`.
