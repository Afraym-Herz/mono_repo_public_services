import 'package:freezed_annotation/freezed_annotation.dart';

part 'prescription_template.freezed.dart';
part 'prescription_template.g.dart';

/// A saved prescription template for quick reuse.
@freezed
class PrescriptionTemplate with _$PrescriptionTemplate {
  const factory PrescriptionTemplate({
    required int id,
    required String name,
    String? description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PrescriptionTemplate;

  factory PrescriptionTemplate.fromJson(
    Map<String, dynamic> json,
  ) => _$PrescriptionTemplateFromJson(json);
}