import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/clinic_settings_table.dart';

part 'settings_dao.g.dart';

@DriftAccessor(tables: [ClinicSettingsTable])
class SettingsDao extends DatabaseAccessor<AppDatabase> with _$SettingsDaoMixin {
  SettingsDao(super.db);

  Future<ClinicSettingsTableData?> getSettings() => select(clinicSettingsTable).getSingleOrNull();
  Future<int> insertSettings(ClinicSettingsTableCompanion entry) => into(clinicSettingsTable).insert(entry);
  Future<bool> updateSettings(ClinicSettingsTableCompanion entry) => update(clinicSettingsTable).replace(entry);
}
