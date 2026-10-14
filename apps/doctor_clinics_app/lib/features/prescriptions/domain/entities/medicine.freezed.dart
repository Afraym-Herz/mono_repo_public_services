// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Medicine _$MedicineFromJson(Map<String, dynamic> json) {
  return _Medicine.fromJson(json);
}

/// @nodoc
mixin _$Medicine {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get alias => throw _privateConstructorUsedError;
  String? get searchText => throw _privateConstructorUsedError;
  String? get defaultDosage => throw _privateConstructorUsedError;
  String? get defaultFrequency => throw _privateConstructorUsedError;
  String? get defaultDuration => throw _privateConstructorUsedError;
  String? get defaultInstructions => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this Medicine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Medicine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicineCopyWith<Medicine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicineCopyWith<$Res> {
  factory $MedicineCopyWith(Medicine value, $Res Function(Medicine) then) =
      _$MedicineCopyWithImpl<$Res, Medicine>;
  @useResult
  $Res call({
    int id,
    String name,
    String? alias,
    String? searchText,
    String? defaultDosage,
    String? defaultFrequency,
    String? defaultDuration,
    String? defaultInstructions,
    String? notes,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? deletedAt,
  });
}

/// @nodoc
class _$MedicineCopyWithImpl<$Res, $Val extends Medicine>
    implements $MedicineCopyWith<$Res> {
  _$MedicineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Medicine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? alias = freezed,
    Object? searchText = freezed,
    Object? defaultDosage = freezed,
    Object? defaultFrequency = freezed,
    Object? defaultDuration = freezed,
    Object? defaultInstructions = freezed,
    Object? notes = freezed,
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
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            alias: freezed == alias
                ? _value.alias
                : alias // ignore: cast_nullable_to_non_nullable
                      as String?,
            searchText: freezed == searchText
                ? _value.searchText
                : searchText // ignore: cast_nullable_to_non_nullable
                      as String?,
            defaultDosage: freezed == defaultDosage
                ? _value.defaultDosage
                : defaultDosage // ignore: cast_nullable_to_non_nullable
                      as String?,
            defaultFrequency: freezed == defaultFrequency
                ? _value.defaultFrequency
                : defaultFrequency // ignore: cast_nullable_to_non_nullable
                      as String?,
            defaultDuration: freezed == defaultDuration
                ? _value.defaultDuration
                : defaultDuration // ignore: cast_nullable_to_non_nullable
                      as String?,
            defaultInstructions: freezed == defaultInstructions
                ? _value.defaultInstructions
                : defaultInstructions // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$MedicineImplCopyWith<$Res>
    implements $MedicineCopyWith<$Res> {
  factory _$$MedicineImplCopyWith(
    _$MedicineImpl value,
    $Res Function(_$MedicineImpl) then,
  ) = __$$MedicineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String? alias,
    String? searchText,
    String? defaultDosage,
    String? defaultFrequency,
    String? defaultDuration,
    String? defaultInstructions,
    String? notes,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? deletedAt,
  });
}

/// @nodoc
class __$$MedicineImplCopyWithImpl<$Res>
    extends _$MedicineCopyWithImpl<$Res, _$MedicineImpl>
    implements _$$MedicineImplCopyWith<$Res> {
  __$$MedicineImplCopyWithImpl(
    _$MedicineImpl _value,
    $Res Function(_$MedicineImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Medicine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? alias = freezed,
    Object? searchText = freezed,
    Object? defaultDosage = freezed,
    Object? defaultFrequency = freezed,
    Object? defaultDuration = freezed,
    Object? defaultInstructions = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _$MedicineImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        alias: freezed == alias
            ? _value.alias
            : alias // ignore: cast_nullable_to_non_nullable
                  as String?,
        searchText: freezed == searchText
            ? _value.searchText
            : searchText // ignore: cast_nullable_to_non_nullable
                  as String?,
        defaultDosage: freezed == defaultDosage
            ? _value.defaultDosage
            : defaultDosage // ignore: cast_nullable_to_non_nullable
                  as String?,
        defaultFrequency: freezed == defaultFrequency
            ? _value.defaultFrequency
            : defaultFrequency // ignore: cast_nullable_to_non_nullable
                  as String?,
        defaultDuration: freezed == defaultDuration
            ? _value.defaultDuration
            : defaultDuration // ignore: cast_nullable_to_non_nullable
                  as String?,
        defaultInstructions: freezed == defaultInstructions
            ? _value.defaultInstructions
            : defaultInstructions // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$MedicineImpl implements _Medicine {
  const _$MedicineImpl({
    required this.id,
    required this.name,
    this.alias,
    this.searchText,
    this.defaultDosage,
    this.defaultFrequency,
    this.defaultDuration,
    this.defaultInstructions,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory _$MedicineImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicineImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? alias;
  @override
  final String? searchText;
  @override
  final String? defaultDosage;
  @override
  final String? defaultFrequency;
  @override
  final String? defaultDuration;
  @override
  final String? defaultInstructions;
  @override
  final String? notes;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Medicine(id: $id, name: $name, alias: $alias, searchText: $searchText, defaultDosage: $defaultDosage, defaultFrequency: $defaultFrequency, defaultDuration: $defaultDuration, defaultInstructions: $defaultInstructions, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.alias, alias) || other.alias == alias) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.defaultDosage, defaultDosage) ||
                other.defaultDosage == defaultDosage) &&
            (identical(other.defaultFrequency, defaultFrequency) ||
                other.defaultFrequency == defaultFrequency) &&
            (identical(other.defaultDuration, defaultDuration) ||
                other.defaultDuration == defaultDuration) &&
            (identical(other.defaultInstructions, defaultInstructions) ||
                other.defaultInstructions == defaultInstructions) &&
            (identical(other.notes, notes) || other.notes == notes) &&
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
    name,
    alias,
    searchText,
    defaultDosage,
    defaultFrequency,
    defaultDuration,
    defaultInstructions,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
  );

  /// Create a copy of Medicine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicineImplCopyWith<_$MedicineImpl> get copyWith =>
      __$$MedicineImplCopyWithImpl<_$MedicineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicineImplToJson(this);
  }
}

abstract class _Medicine implements Medicine {
  const factory _Medicine({
    required final int id,
    required final String name,
    final String? alias,
    final String? searchText,
    final String? defaultDosage,
    final String? defaultFrequency,
    final String? defaultDuration,
    final String? defaultInstructions,
    final String? notes,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final DateTime? deletedAt,
  }) = _$MedicineImpl;

  factory _Medicine.fromJson(Map<String, dynamic> json) =
      _$MedicineImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get alias;
  @override
  String? get searchText;
  @override
  String? get defaultDosage;
  @override
  String? get defaultFrequency;
  @override
  String? get defaultDuration;
  @override
  String? get defaultInstructions;
  @override
  String? get notes;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of Medicine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicineImplCopyWith<_$MedicineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
