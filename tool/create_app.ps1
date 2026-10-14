param(
  [Parameter(Mandatory = $true)][string]$AppName,
  [string]$Org = "com.example",
  [string]$Platforms = "android,ios,web,windows,linux,macos"
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$dest = Join-Path $root "apps/$AppName"

if (Test-Path $dest) { throw "apps/$AppName already exists." }

Write-Host "1/3 flutter create $AppName ..."
flutter create --project-name $AppName --org $Org --platforms $Platforms $dest

Write-Host "2/3 write template wiring ..."
$pubspec = @"
name: $AppName
description: $AppName app — shares package:core in this monorepo.
publish_to: none
version: 0.1.0+1

environment:
  sdk: ^3.12.0

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8

  core:
    path: ../../core

  flutter_bloc: ^9.1.1
  get_it: ^8.0.3
  go_router: ^15.1.3
  easy_localization: ^3.0.7
  flutter_screenutil: ^5.9.3
  firebase_core: ^3.15.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0

flutter:
  uses-material-design: true

  assets:
    - assets/translations/
"@
Set-Content "$dest/pubspec.yaml" $pubspec -NoNewline
Set-Content "$dest/analysis_options.yaml" "include: ../../analysis_options.yaml`n" -NoNewline

$main = @"
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:core/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await initDependencies();
  await getIt<AppAuthCubit>().checkAuthStatus();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const RootApp(),
    ),
  );
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<ThemeCubit>()),
        BlocProvider.value(value: getIt<AppAuthCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          ThemeManager.setDarkMode(themeState.darkTheme);
          final router = AppRouter.createRouter();
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            builder: (context, child) => MaterialApp.router(
              title: '$AppName',
              debugShowCheckedModeBanner: false,
              theme: AppColorSchemes.light,
              darkTheme: AppColorSchemes.dark,
              themeMode: themeState.darkTheme
                  ? ThemeMode.dark
                  : ThemeMode.light,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              routerConfig: router,
            ),
          );
        },
      ),
    );
  }
}
"@
Set-Content "$dest/lib/main.dart" $main -NoNewline

New-Item -ItemType Directory -Force -Path "$dest/assets/translations" | Out-Null
Set-Content "$dest/assets/translations/.gitkeep" "" -NoNewline

Write-Host "3/3 pub get ..."
Push-Location $dest
flutter pub get
Pop-Location

Write-Host "Done. App created at apps/$AppName."
