import 'package:freezed_annotation/freezed_annotation.dart';

part 'clinic_settings.freezed.dart';
part 'clinic_settings.g.dart';

@freezed
class ClinicSettings with _$ClinicSettings {
  const factory ClinicSettings({
    required String clinicName,
    required String language,
    required String paperSize,
    required int receiptMargin,
  }) = _ClinicSettings;

  factory ClinicSettings.fromJson(Map<String, dynamic> json) => _$ClinicSettingsFromJson(json);
}
