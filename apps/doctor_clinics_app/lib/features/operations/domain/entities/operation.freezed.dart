// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Operation _$OperationFromJson(Map<String, dynamic> json) {
  return _Operation.fromJson(json);
}

/// @nodoc
mixin _$Operation {
  int get id => throw _privateConstructorUsedError;
  int get patientId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get scheduledDate => throw _privateConstructorUsedError;
  String? get scheduledTime => throw _privateConstructorUsedError;
  String? get surgeonName => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get depositPiasters => throw _privateConstructorUsedError;
  int? get totalCostPiasters => throw _privateConstructorUsedError;
  int get createdBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this Operation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Operation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OperationCopyWith<Operation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationCopyWith<$Res> {
  factory $OperationCopyWith(Operation value, $Res Function(Operation) then) =
      _$OperationCopyWithImpl<$Res, Operation>;
  @useResult
  $Res call({
    int id,
    int patientId,
    String name,
    DateTime scheduledDate,
    String? scheduledTime,
    String? surgeonName,
    String? notes,
    String? status,
    int? depositPiasters,
    int? totalCostPiasters,
    int createdBy,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? deletedAt,
  });
}

/// @nodoc
class _$OperationCopyWithImpl<$Res, $Val extends Operation>
    implements $OperationCopyWith<$Res> {
  _$OperationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Operation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? name = null,
    Object? scheduledDate = null,
    Object? scheduledTime = freezed,
    Object? surgeonName = freezed,
    Object? notes = freezed,
    Object? status = freezed,
    Object? depositPiasters = freezed,
    Object? totalCostPiasters = freezed,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
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
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            scheduledDate: null == scheduledDate
                ? _value.scheduledDate
                : scheduledDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            scheduledTime: freezed == scheduledTime
                ? _value.scheduledTime
                : scheduledTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            surgeonName: freezed == surgeonName
                ? _value.surgeonName
                : surgeonName // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            depositPiasters: freezed == depositPiasters
                ? _value.depositPiasters
                : depositPiasters // ignore: cast_nullable_to_non_nullable
                      as int?,
            totalCostPiasters: freezed == totalCostPiasters
                ? _value.totalCostPiasters
                : totalCostPiasters // ignore: cast_nullable_to_non_nullable
                      as int?,
            createdBy: null == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            deletedAt: freezed == deletedAt
                ? _value.deletedAt
                : deletedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OperationImplCopyWith<$Res>
    implements $OperationCopyWith<$Res> {
  factory _$$OperationImplCopyWith(
    _$OperationImpl value,
    $Res Function(_$OperationImpl) then,
  ) = __$$OperationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int patientId,
    String name,
    DateTime scheduledDate,
    String? scheduledTime,
    String? surgeonName,
    String? notes,
    String? status,
    int? depositPiasters,
    int? totalCostPiasters,
    int createdBy,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? deletedAt,
  });
}

/// @nodoc
class __$$OperationImplCopyWithImpl<$Res>
    extends _$OperationCopyWithImpl<$Res, _$OperationImpl>
    implements _$$OperationImplCopyWith<$Res> {
  __$$OperationImplCopyWithImpl(
    _$OperationImpl _value,
    $Res Function(_$OperationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Operation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? name = null,
    Object? scheduledDate = null,
    Object? scheduledTime = freezed,
    Object? surgeonName = freezed,
    Object? notes = freezed,
    Object? status = freezed,
    Object? depositPiasters = freezed,
    Object? totalCostPiasters = freezed,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _$OperationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        patientId: null == patientId
            ? _value.patientId
            : patientId // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        scheduledDate: null == scheduledDate
            ? _value.scheduledDate
            : scheduledDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        scheduledTime: freezed == scheduledTime
            ? _value.scheduledTime
            : scheduledTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        surgeonName: freezed == surgeonName
            ? _value.surgeonName
            : surgeonName // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        depositPiasters: freezed == depositPiasters
            ? _value.depositPiasters
            : depositPiasters // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalCostPiasters: freezed == totalCostPiasters
            ? _value.totalCostPiasters
            : totalCostPiasters // ignore: cast_nullable_to_non_nullable
                  as int?,
        createdBy: null == createdBy
            ? _value.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        deletedAt: freezed == deletedAt
            ? _value.deletedAt
            : deletedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OperationImpl implements _Operation {
  const _$OperationImpl({
    required this.id,
    required this.patientId,
    required this.name,
    required this.scheduledDate,
    this.scheduledTime,
    this.surgeonName,
    this.notes,
    this.status,
    this.depositPiasters,
    this.totalCostPiasters,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory _$OperationImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperationImplFromJson(json);

  @override
  final int id;
  @override
  final int patientId;
  @override
  final String name;
  @override
  final DateTime scheduledDate;
  @override
  final String? scheduledTime;
  @override
  final String? surgeonName;
  @override
  final String? notes;
  @override
  final String? status;
  @override
  final int? depositPiasters;
  @override
  final int? totalCostPiasters;
  @override
  final int createdBy;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Operation(id: $id, patientId: $patientId, name: $name, scheduledDate: $scheduledDate, scheduledTime: $scheduledTime, surgeonName: $surgeonName, notes: $notes, status: $status, depositPiasters: $depositPiasters, totalCostPiasters: $totalCostPiasters, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.surgeonName, surgeonName) ||
                other.surgeonName == surgeonName) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.depositPiasters, depositPiasters) ||
                other.depositPiasters == depositPiasters) &&
            (identical(other.totalCostPiasters, totalCostPiasters) ||
                other.totalCostPiasters == totalCostPiasters) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    patientId,
    name,
    scheduledDate,
    scheduledTime,
    surgeonName,
    notes,
    status,
    depositPiasters,
    totalCostPiasters,
    createdBy,
    createdAt,
    updatedAt,
    deletedAt,
  );

  /// Create a copy of Operation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationImplCopyWith<_$OperationImpl> get copyWith =>
      __$$OperationImplCopyWithImpl<_$OperationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperationImplToJson(this);
  }
}

abstract class _Operation implements Operation {
  const factory _Operation({
    required final int id,
    required final int patientId,
    required final String name,
    required final DateTime scheduledDate,
    final String? scheduledTime,
    final String? surgeonName,
    final String? notes,
    final String? status,
    final int? depositPiasters,
    final int? totalCostPiasters,
    required final int createdBy,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final DateTime? deletedAt,
  }) = _$OperationImpl;

  factory _Operation.fromJson(Map<String, dynamic> json) =
      _$OperationImpl.fromJson;

  @override
  int get id;
  @override
  int get patientId;
  @override
  String get name;
  @override
  DateTime get scheduledDate;
  @override
  String? get scheduledTime;
  @override
  String? get surgeonName;
  @override
  String? get notes;
  @override
  String? get status;
  @override
  int? get depositPiasters;
  @override
  int? get totalCostPiasters;
  @override
  int get createdBy;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of Operation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperationImplCopyWith<_$OperationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
