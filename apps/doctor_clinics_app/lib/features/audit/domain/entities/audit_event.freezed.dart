// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AuditEvent _$AuditEventFromJson(Map<String, dynamic> json) {
  return _AuditEvent.fromJson(json);
}

/// @nodoc
mixin _$AuditEvent {
  int get id => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  String get entityType => throw _privateConstructorUsedError;
  int get entityId => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String? get oldValue => throw _privateConstructorUsedError;
  String? get newValue => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AuditEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuditEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuditEventCopyWith<AuditEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuditEventCopyWith<$Res> {
  factory $AuditEventCopyWith(
    AuditEvent value,
    $Res Function(AuditEvent) then,
  ) = _$AuditEventCopyWithImpl<$Res, AuditEvent>;
  @useResult
  $Res call({
    int id,
    String action,
    String entityType,
    int entityId,
    int? userId,
    String? oldValue,
    String? newValue,
    DateTime createdAt,
  });
}

/// @nodoc
class _$AuditEventCopyWithImpl<$Res, $Val extends AuditEvent>
    implements $AuditEventCopyWith<$Res> {
  _$AuditEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuditEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? action = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? userId = freezed,
    Object? oldValue = freezed,
    Object? newValue = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as String,
            entityType: null == entityType
                ? _value.entityType
                : entityType // ignore: cast_nullable_to_non_nullable
                      as String,
            entityId: null == entityId
                ? _value.entityId
                : entityId // ignore: cast_nullable_to_non_nullable
                      as int,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int?,
            oldValue: freezed == oldValue
                ? _value.oldValue
                : oldValue // ignore: cast_nullable_to_non_nullable
                      as String?,
            newValue: freezed == newValue
                ? _value.newValue
                : newValue // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuditEventImplCopyWith<$Res>
    implements $AuditEventCopyWith<$Res> {
  factory _$$AuditEventImplCopyWith(
    _$AuditEventImpl value,
    $Res Function(_$AuditEventImpl) then,
  ) = __$$AuditEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String action,
    String entityType,
    int entityId,
    int? userId,
    String? oldValue,
    String? newValue,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$AuditEventImplCopyWithImpl<$Res>
    extends _$AuditEventCopyWithImpl<$Res, _$AuditEventImpl>
    implements _$$AuditEventImplCopyWith<$Res> {
  __$$AuditEventImplCopyWithImpl(
    _$AuditEventImpl _value,
    $Res Function(_$AuditEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuditEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? action = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? userId = freezed,
    Object? oldValue = freezed,
    Object? newValue = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$AuditEventImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as String,
        entityType: null == entityType
            ? _value.entityType
            : entityType // ignore: cast_nullable_to_non_nullable
                  as String,
        entityId: null == entityId
            ? _value.entityId
            : entityId // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int?,
        oldValue: freezed == oldValue
            ? _value.oldValue
            : oldValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        newValue: freezed == newValue
            ? _value.newValue
            : newValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuditEventImpl implements _AuditEvent {
  const _$AuditEventImpl({
    required this.id,
    required this.action,
    required this.entityType,
    required this.entityId,
    this.userId,
    this.oldValue,
    this.newValue,
    required this.createdAt,
  });

  factory _$AuditEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuditEventImplFromJson(json);

  @override
  final int id;
  @override
  final String action;
  @override
  final String entityType;
  @override
  final int entityId;
  @override
  final int? userId;
  @override
  final String? oldValue;
  @override
  final String? newValue;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'AuditEvent(id: $id, action: $action, entityType: $entityType, entityId: $entityId, userId: $userId, oldValue: $oldValue, newValue: $newValue, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuditEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.oldValue, oldValue) ||
                other.oldValue == oldValue) &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    action,
    entityType,
    entityId,
    userId,
    oldValue,
    newValue,
    createdAt,
  );

  /// Create a copy of AuditEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuditEventImplCopyWith<_$AuditEventImpl> get copyWith =>
      __$$AuditEventImplCopyWithImpl<_$AuditEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuditEventImplToJson(this);
  }
}

abstract class _AuditEvent implements AuditEvent {
  const factory _AuditEvent({
    required final int id,
    required final String action,
    required final String entityType,
    required final int entityId,
    final int? userId,
    final String? oldValue,
    final String? newValue,
    required final DateTime createdAt,
  }) = _$AuditEventImpl;

  factory _AuditEvent.fromJson(Map<String, dynamic> json) =
      _$AuditEventImpl.fromJson;

  @override
  int get id;
  @override
  String get action;
  @override
  String get entityType;
  @override
  int get entityId;
  @override
  int? get userId;
  @override
  String? get oldValue;
  @override
  String? get newValue;
  @override
  DateTime get createdAt;

  /// Create a copy of AuditEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuditEventImplCopyWith<_$AuditEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
