// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PrescriptionTemplate _$PrescriptionTemplateFromJson(Map<String, dynamic> json) {
  return _PrescriptionTemplate.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionTemplate {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PrescriptionTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrescriptionTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionTemplateCopyWith<PrescriptionTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionTemplateCopyWith<$Res> {
  factory $PrescriptionTemplateCopyWith(
    PrescriptionTemplate value,
    $Res Function(PrescriptionTemplate) then,
  ) = _$PrescriptionTemplateCopyWithImpl<$Res, PrescriptionTemplate>;
  @useResult
  $Res call({
    int id,
    String name,
    String? description,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$PrescriptionTemplateCopyWithImpl<
  $Res,
  $Val extends PrescriptionTemplate
>
    implements $PrescriptionTemplateCopyWith<$Res> {
  _$PrescriptionTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrescriptionTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrescriptionTemplateImplCopyWith<$Res>
    implements $PrescriptionTemplateCopyWith<$Res> {
  factory _$$PrescriptionTemplateImplCopyWith(
    _$PrescriptionTemplateImpl value,
    $Res Function(_$PrescriptionTemplateImpl) then,
  ) = __$$PrescriptionTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String? description,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$PrescriptionTemplateImplCopyWithImpl<$Res>
    extends _$PrescriptionTemplateCopyWithImpl<$Res, _$PrescriptionTemplateImpl>
    implements _$$PrescriptionTemplateImplCopyWith<$Res> {
  __$$PrescriptionTemplateImplCopyWithImpl(
    _$PrescriptionTemplateImpl _value,
    $Res Function(_$PrescriptionTemplateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrescriptionTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$PrescriptionTemplateImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionTemplateImpl implements _PrescriptionTemplate {
  const _$PrescriptionTemplateImpl({
    required this.id,
    required this.name,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$PrescriptionTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionTemplateImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PrescriptionTemplate(id: $id, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, createdAt, updatedAt);

  /// Create a copy of PrescriptionTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionTemplateImplCopyWith<_$PrescriptionTemplateImpl>
  get copyWith =>
      __$$PrescriptionTemplateImplCopyWithImpl<_$PrescriptionTemplateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionTemplateImplToJson(this);
  }
}

abstract class _PrescriptionTemplate implements PrescriptionTemplate {
  const factory _PrescriptionTemplate({
    required final int id,
    required final String name,
    final String? description,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$PrescriptionTemplateImpl;

  factory _PrescriptionTemplate.fromJson(Map<String, dynamic> json) =
      _$PrescriptionTemplateImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of PrescriptionTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionTemplateImplCopyWith<_$PrescriptionTemplateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
