import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';
part 'report.g.dart';

/// Metadata for a generated report.
@freezed
class Report with _$Report {
  const factory Report({
    required int id,
    required String type,
    required DateTime fromDate,
    required DateTime toDate,
    required String format,
    String? filePath,
    required DateTime generatedAt,
    required int generatedBy,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) =>
      _$ReportFromJson(json);
}