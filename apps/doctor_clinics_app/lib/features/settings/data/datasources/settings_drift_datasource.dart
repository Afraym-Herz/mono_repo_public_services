import 'package:core/core.dart';
import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/settings_dao.dart';
import 'package:doctor_clinics_app/features/settings/data/datasources/settings_datasource.dart';
import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_settings.dart';
import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_template.dart';

/// Concrete Drift implementation of [ISettingsDatasource].
class SettingsDriftDatasource implements ISettingsDatasource {
  final SettingsDao dao;

  SettingsDriftDatasource(this.dao);

  @override
  Future<ClinicSettings?> fetchSettings() async {
    final row = await dao.getSettings();
    if (row == null) {
      return const ClinicSettings(
        clinicName: 'My Clinic',
        language: 'ar',
        paperSize: AppConstants.paperSizeA4,
        receiptMargin: 10,
      );
    }
    return ClinicSettings(
      clinicName: row.clinicName,
      language: row.printLanguage,
      paperSize: row.paperSize,
      receiptMargin: 10,
    );
  }

  @override
  Future<void> upsertSettings(ClinicSettings settings) async {
    final existing = await dao.getSettings();
    await dao.upsertSettings(
      ClinicSettingsTableCompanion(
        id: Value(existing?.id ?? 1),
        clinicName: Value(settings.clinicName),
        printLanguage: Value(settings.language),
        paperSize: Value(settings.paperSize),
      ),
    );
  }

  @override
  Future<ClinicTemplate?> fetchClinicTemplate() async {
    final row = await dao.getSettings();
    final now = DateTime.now();
    if (row == null) {
      return ClinicTemplate(
        id: 1,
        clinicNameAr: 'عيادتي',
        doctorNameAr: 'د. الطبيب',
        printLanguage: 'ar',
        paperSize: AppConstants.paperSizeA4,
        createdAt: now,
        updatedAt: now,
      );
    }
    return ClinicTemplate(
      id: row.id,
      clinicNameAr: row.clinicName,
      doctorNameAr: row.doctorName ?? '',
      specialtyAr: row.specialty,
      qualificationsAr: row.qualifications,
      phone: row.phones,
      addressAr: row.address,
      logoPath: row.logoPath,
      printLanguage: row.printLanguage,
      paperSize: row.paperSize,
      defaultConsultationFeePiasters: row.defaultConsultationFee,
      slotLengthMinutes: row.slotLengthMinutes,
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  Future<void> upsertClinicTemplate(ClinicTemplate template) async {
    final existing = await dao.getSettings();
    await dao.upsertSettings(
      ClinicSettingsTableCompanion(
        id: Value(existing?.id ?? template.id),
        clinicName: Value(template.clinicNameAr),
        doctorName: Value(template.doctorNameAr),
        specialty: Value(template.specialtyAr),
        qualifications: Value(template.qualificationsAr),
        phones: Value(template.phone),
        address: Value(template.addressAr),
        logoPath: Value(template.logoPath),
        printLanguage: Value(template.printLanguage),
        paperSize: Value(template.paperSize),
        defaultConsultationFee: Value(template.defaultConsultationFeePiasters ?? 0),
        slotLengthMinutes: Value(template.slotLengthMinutes ?? 15),
      ),
    );
  }
}
