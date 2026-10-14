// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queue_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QueueEntry _$QueueEntryFromJson(Map<String, dynamic> json) {
  return _QueueEntry.fromJson(json);
}

/// @nodoc
mixin _$QueueEntry {
  int get id => throw _privateConstructorUsedError;
  int get patientId => throw _privateConstructorUsedError;
  DateTime get scheduledAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this QueueEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QueueEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QueueEntryCopyWith<QueueEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueueEntryCopyWith<$Res> {
  factory $QueueEntryCopyWith(
    QueueEntry value,
    $Res Function(QueueEntry) then,
  ) = _$QueueEntryCopyWithImpl<$Res, QueueEntry>;
  @useResult
  $Res call({int id, int patientId, DateTime scheduledAt, String status});
}

/// @nodoc
class _$QueueEntryCopyWithImpl<$Res, $Val extends QueueEntry>
    implements $QueueEntryCopyWith<$Res> {
  _$QueueEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QueueEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? scheduledAt = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            patientId: null == patientId
                ? _value.patientId
                : patientId // ignore: cast_nullable_to_non_nullable
                      as int,
            scheduledAt: null == scheduledAt
                ? _value.scheduledAt
                : scheduledAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QueueEntryImplCopyWith<$Res>
    implements $QueueEntryCopyWith<$Res> {
  factory _$$QueueEntryImplCopyWith(
    _$QueueEntryImpl value,
    $Res Function(_$QueueEntryImpl) then,
  ) = __$$QueueEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int patientId, DateTime scheduledAt, String status});
}

/// @nodoc
class __$$QueueEntryImplCopyWithImpl<$Res>
    extends _$QueueEntryCopyWithImpl<$Res, _$QueueEntryImpl>
    implements _$$QueueEntryImplCopyWith<$Res> {
  __$$QueueEntryImplCopyWithImpl(
    _$QueueEntryImpl _value,
    $Res Function(_$QueueEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QueueEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? scheduledAt = null,
    Object? status = null,
  }) {
    return _then(
      _$QueueEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        patientId: null == patientId
            ? _value.patientId
            : patientId // ignore: cast_nullable_to_non_nullable
                  as int,
        scheduledAt: null == scheduledAt
            ? _value.scheduledAt
            : scheduledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QueueEntryImpl implements _QueueEntry {
  const _$QueueEntryImpl({
    required this.id,
    required this.patientId,
    required this.scheduledAt,
    required this.status,
  });

  factory _$QueueEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueueEntryImplFromJson(json);

  @override
  final int id;
  @override
  final int patientId;
  @override
  final DateTime scheduledAt;
  @override
  final String status;

  @override
  String toString() {
    return 'QueueEntry(id: $id, patientId: $patientId, scheduledAt: $scheduledAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueueEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, patientId, scheduledAt, status);

  /// Create a copy of QueueEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueueEntryImplCopyWith<_$QueueEntryImpl> get copyWith =>
      __$$QueueEntryImplCopyWithImpl<_$QueueEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueueEntryImplToJson(this);
  }
}

abstract class _QueueEntry implements QueueEntry {
  const factory _QueueEntry({
    required final int id,
    required final int patientId,
    required final DateTime scheduledAt,
    required final String status,
  }) = _$QueueEntryImpl;

  factory _QueueEntry.fromJson(Map<String, dynamic> json) =
      _$QueueEntryImpl.fromJson;

  @override
  int get id;
  @override
  int get patientId;
  @override
  DateTime get scheduledAt;
  @override
  String get status;

  /// Create a copy of QueueEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueueEntryImplCopyWith<_$QueueEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
