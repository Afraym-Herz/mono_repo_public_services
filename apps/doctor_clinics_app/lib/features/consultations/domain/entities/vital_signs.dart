import 'package:freezed_annotation/freezed_annotation.dart';

part 'vital_signs.freezed.dart';
part 'vital_signs.g.dart';

@freezed
class VitalSigns with _$VitalSigns {
  const factory VitalSigns({
    required int id,
    required int consultationId,
    double? weightKg,
    double? heightCm,
    int? bpSystolic,
    int? bpDiastolic,
    int? pulse,
    double? temperatureC,
    int? spo2,
    double? bloodSugar,
    String? notes,
  }) = _VitalSigns;

  factory VitalSigns.fromJson(Map<String, dynamic> json) =>
      _$VitalSignsFromJson(json);
}