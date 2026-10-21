import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
class Patient with _$Patient {
  const factory Patient({
    required int id,
    required String fileNumber,
    required String fullName,
    required String searchText,
    required String gender,
    DateTime? birthDate,
    String? phone,
    String? phone2,
    String? address,
    String? occupation,
    String? notes,
    String? bloodType,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);
}
