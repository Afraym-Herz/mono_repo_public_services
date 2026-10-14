import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_event.freezed.dart';
part 'audit_event.g.dart';

@freezed
class AuditEvent with _$AuditEvent {
  const factory AuditEvent({
    required int id,
    required String action,
    required String entityType,
    required int entityId,
    int? userId,
    String? oldValue,
    String? newValue,
    required DateTime createdAt,
  }) = _AuditEvent;

  factory AuditEvent.fromJson(Map<String, dynamic> json) =>
      _$AuditEventFromJson(json);
}