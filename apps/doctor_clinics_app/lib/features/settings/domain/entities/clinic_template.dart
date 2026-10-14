import 'package:freezed_annotation/freezed_annotation.dart';

part 'clinic_template.freezed.dart';
part 'clinic_template.g.dart';

/// The clinic template controls print layout and header/footer.
@freezed
class ClinicTemplate with _$ClinicTemplate {
  const factory ClinicTemplate({
    required int id,
    required String clinicNameAr,
    String? clinicNameEn,
    required String doctorNameAr,
    String? doctorNameEn,
    String? specialtyAr,
    String? specialtyEn,
    String? qualificationsAr,
    String? qualificationsEn,
    String? phone,
    String? phone2,
    String? addressAr,
    String? addressEn,
    String? logoPath,
    String? headerText,
    String? footerText,
    required String printLanguage,
    required String paperSize,
    int? marginTop,
    int? marginBottom,
    int? marginLeft,
    int? marginRight,
    int? fontSize,
    String? bottomNotes,
    int? defaultConsultationFeePiasters,
    String? workingDays,
    int? slotLengthMinutes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ClinicTemplate;

  factory ClinicTemplate.fromJson(Map<String, dynamic> json) =>
      _$ClinicTemplateFromJson(json);
}