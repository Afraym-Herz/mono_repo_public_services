import 'package:freezed_annotation/freezed_annotation.dart';

part 'queue_entry.freezed.dart';
part 'queue_entry.g.dart';

@freezed
class QueueEntry with _$QueueEntry {
  const factory QueueEntry({
    required int id,
    required int patientId,
    required DateTime scheduledAt,
    required String status,
  }) = _QueueEntry;

  factory QueueEntry.fromJson(Map<String, dynamic> json) => _$QueueEntryFromJson(json);
}
