// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_allergy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PatientAllergy _$PatientAllergyFromJson(Map<String, dynamic> json) {
  return _PatientAllergy.fromJson(json);
}

/// @nodoc
mixin _$PatientAllergy {
  int get id => throw _privateConstructorUsedError;
  int get patientId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get severity => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this PatientAllergy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientAllergy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientAllergyCopyWith<PatientAllergy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientAllergyCopyWith<$Res> {
  factory $PatientAllergyCopyWith(
    PatientAllergy value,
    $Res Function(PatientAllergy) then,
  ) = _$PatientAllergyCopyWithImpl<$Res, PatientAllergy>;
  @useResult
  $Res call({
    int id,
    int patientId,
    String name,
    String? severity,
    String? notes,
  });
}

/// @nodoc
class _$PatientAllergyCopyWithImpl<$Res, $Val extends PatientAllergy>
    implements $PatientAllergyCopyWith<$Res> {
  _$PatientAllergyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientAllergy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? name = null,
    Object? severity = freezed,
    Object? notes = freezed,
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
            severity: freezed == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PatientAllergyImplCopyWith<$Res>
    implements $PatientAllergyCopyWith<$Res> {
  factory _$$PatientAllergyImplCopyWith(
    _$PatientAllergyImpl value,
    $Res Function(_$PatientAllergyImpl) then,
  ) = __$$PatientAllergyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int patientId,
    String name,
    String? severity,
    String? notes,
  });
}

/// @nodoc
class __$$PatientAllergyImplCopyWithImpl<$Res>
    extends _$PatientAllergyCopyWithImpl<$Res, _$PatientAllergyImpl>
    implements _$$PatientAllergyImplCopyWith<$Res> {
  __$$PatientAllergyImplCopyWithImpl(
    _$PatientAllergyImpl _value,
    $Res Function(_$PatientAllergyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientAllergy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? name = null,
    Object? severity = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$PatientAllergyImpl(
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
        severity: freezed == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientAllergyImpl implements _PatientAllergy {
  const _$PatientAllergyImpl({
    required this.id,
    required this.patientId,
    required this.name,
    this.severity,
    this.notes,
  });

  factory _$PatientAllergyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientAllergyImplFromJson(json);

  @override
  final int id;
  @override
  final int patientId;
  @override
  final String name;
  @override
  final String? severity;
  @override
  final String? notes;

  @override
  String toString() {
    return 'PatientAllergy(id: $id, patientId: $patientId, name: $name, severity: $severity, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientAllergyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, patientId, name, severity, notes);

  /// Create a copy of PatientAllergy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientAllergyImplCopyWith<_$PatientAllergyImpl> get copyWith =>
      __$$PatientAllergyImplCopyWithImpl<_$PatientAllergyImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientAllergyImplToJson(this);
  }
}

abstract class _PatientAllergy implements PatientAllergy {
  const factory _PatientAllergy({
    required final int id,
    required final int patientId,
    required final String name,
    final String? severity,
    final String? notes,
  }) = _$PatientAllergyImpl;

  factory _PatientAllergy.fromJson(Map<String, dynamic> json) =
      _$PatientAllergyImpl.fromJson;

  @override
  int get id;
  @override
  int get patientId;
  @override
  String get name;
  @override
  String? get severity;
  @override
  String? get notes;

  /// Create a copy of PatientAllergy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientAllergyImplCopyWith<_$PatientAllergyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
