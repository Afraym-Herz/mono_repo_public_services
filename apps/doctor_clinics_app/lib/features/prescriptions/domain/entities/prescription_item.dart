import 'package:freezed_annotation/freezed_annotation.dart';

part 'prescription_item.freezed.dart';
part 'prescription_item.g.dart';

@freezed
class PrescriptionItem with _$PrescriptionItem {
  const factory PrescriptionItem({
    required int id,
    required int prescriptionId,
    required int medicineId,
    required String medicineName,
    required String dosage,
    required String frequency,
    required String duration,
    String? instructions,
    String? notes,
  }) = _PrescriptionItem;

  factory PrescriptionItem.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionItemFromJson(json);
}