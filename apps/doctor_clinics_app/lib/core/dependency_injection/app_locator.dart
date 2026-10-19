import 'package:doctor_clinics_app/core/dependency_injection/app_locator_cubits.dart';
import 'package:doctor_clinics_app/core/dependency_injection/app_locator_database.dart';
import 'package:doctor_clinics_app/core/dependency_injection/app_locator_datasources.dart';
import 'package:doctor_clinics_app/core/dependency_injection/app_locator_repositories.dart';

/// Register app-specific dependencies: Drift database, DAOs, repositories, and cubits.
void setupAppLocator() {
  registerAppDatabase();
  registerAppDatasources();
  registerAppRepositories();
  registerAppCubits();
}
