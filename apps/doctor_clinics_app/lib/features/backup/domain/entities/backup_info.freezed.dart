// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BackupInfo _$BackupInfoFromJson(Map<String, dynamic> json) {
  return _BackupInfo.fromJson(json);
}

/// @nodoc
mixin _$BackupInfo {
  String get filePath => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get sizeBytes => throw _privateConstructorUsedError;
  String get schemaVersion => throw _privateConstructorUsedError;

  /// Serializes this BackupInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BackupInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BackupInfoCopyWith<BackupInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackupInfoCopyWith<$Res> {
  factory $BackupInfoCopyWith(
    BackupInfo value,
    $Res Function(BackupInfo) then,
  ) = _$BackupInfoCopyWithImpl<$Res, BackupInfo>;
  @useResult
  $Res call({
    String filePath,
    DateTime createdAt,
    int sizeBytes,
    String schemaVersion,
  });
}

/// @nodoc
class _$BackupInfoCopyWithImpl<$Res, $Val extends BackupInfo>
    implements $BackupInfoCopyWith<$Res> {
  _$BackupInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BackupInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
    Object? createdAt = null,
    Object? sizeBytes = null,
    Object? schemaVersion = null,
  }) {
    return _then(
      _value.copyWith(
            filePath: null == filePath
                ? _value.filePath
                : filePath // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            sizeBytes: null == sizeBytes
                ? _value.sizeBytes
                : sizeBytes // ignore: cast_nullable_to_non_nullable
                      as int,
            schemaVersion: null == schemaVersion
                ? _value.schemaVersion
                : schemaVersion // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BackupInfoImplCopyWith<$Res>
    implements $BackupInfoCopyWith<$Res> {
  factory _$$BackupInfoImplCopyWith(
    _$BackupInfoImpl value,
    $Res Function(_$BackupInfoImpl) then,
  ) = __$$BackupInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String filePath,
    DateTime createdAt,
    int sizeBytes,
    String schemaVersion,
  });
}

/// @nodoc
class __$$BackupInfoImplCopyWithImpl<$Res>
    extends _$BackupInfoCopyWithImpl<$Res, _$BackupInfoImpl>
    implements _$$BackupInfoImplCopyWith<$Res> {
  __$$BackupInfoImplCopyWithImpl(
    _$BackupInfoImpl _value,
    $Res Function(_$BackupInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BackupInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
    Object? createdAt = null,
    Object? sizeBytes = null,
    Object? schemaVersion = null,
  }) {
    return _then(
      _$BackupInfoImpl(
        filePath: null == filePath
            ? _value.filePath
            : filePath // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        sizeBytes: null == sizeBytes
            ? _value.sizeBytes
            : sizeBytes // ignore: cast_nullable_to_non_nullable
                  as int,
        schemaVersion: null == schemaVersion
            ? _value.schemaVersion
            : schemaVersion // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BackupInfoImpl implements _BackupInfo {
  const _$BackupInfoImpl({
    required this.filePath,
    required this.createdAt,
    required this.sizeBytes,
    required this.schemaVersion,
  });

  factory _$BackupInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackupInfoImplFromJson(json);

  @override
  final String filePath;
  @override
  final DateTime createdAt;
  @override
  final int sizeBytes;
  @override
  final String schemaVersion;

  @override
  String toString() {
    return 'BackupInfo(filePath: $filePath, createdAt: $createdAt, sizeBytes: $sizeBytes, schemaVersion: $schemaVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackupInfoImpl &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.sizeBytes, sizeBytes) ||
                other.sizeBytes == sizeBytes) &&
            (identical(other.schemaVersion, schemaVersion) ||
                other.schemaVersion == schemaVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, filePath, createdAt, sizeBytes, schemaVersion);

  /// Create a copy of BackupInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BackupInfoImplCopyWith<_$BackupInfoImpl> get copyWith =>
      __$$BackupInfoImplCopyWithImpl<_$BackupInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BackupInfoImplToJson(this);
  }
}

abstract class _BackupInfo implements BackupInfo {
  const factory _BackupInfo({
    required final String filePath,
    required final DateTime createdAt,
    required final int sizeBytes,
    required final String schemaVersion,
  }) = _$BackupInfoImpl;

  factory _BackupInfo.fromJson(Map<String, dynamic> json) =
      _$BackupInfoImpl.fromJson;

  @override
  String get filePath;
  @override
  DateTime get createdAt;
  @override
  int get sizeBytes;
  @override
  String get schemaVersion;

  /// Create a copy of BackupInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BackupInfoImplCopyWith<_$BackupInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
