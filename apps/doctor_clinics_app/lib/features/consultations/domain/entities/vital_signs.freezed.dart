// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vital_signs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VitalSigns _$VitalSignsFromJson(Map<String, dynamic> json) {
  return _VitalSigns.fromJson(json);
}

/// @nodoc
mixin _$VitalSigns {
  int get id => throw _privateConstructorUsedError;
  int get consultationId => throw _privateConstructorUsedError;
  double? get weightKg => throw _privateConstructorUsedError;
  double? get heightCm => throw _privateConstructorUsedError;
  int? get bpSystolic => throw _privateConstructorUsedError;
  int? get bpDiastolic => throw _privateConstructorUsedError;
  int? get pulse => throw _privateConstructorUsedError;
  double? get temperatureC => throw _privateConstructorUsedError;
  int? get spo2 => throw _privateConstructorUsedError;
  double? get bloodSugar => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this VitalSigns to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VitalSigns
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VitalSignsCopyWith<VitalSigns> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VitalSignsCopyWith<$Res> {
  factory $VitalSignsCopyWith(
    VitalSigns value,
    $Res Function(VitalSigns) then,
  ) = _$VitalSignsCopyWithImpl<$Res, VitalSigns>;
  @useResult
  $Res call({
    int id,
    int consultationId,
    double? weightKg,
    double? heightCm,
    int? bpSystolic,
    int? bpDiastolic,
    int? pulse,
    double? temperatureC,
    int? spo2,
    double? bloodSugar,
    String? notes,
  });
}

/// @nodoc
class _$VitalSignsCopyWithImpl<$Res, $Val extends VitalSigns>
    implements $VitalSignsCopyWith<$Res> {
  _$VitalSignsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VitalSigns
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? consultationId = null,
    Object? weightKg = freezed,
    Object? heightCm = freezed,
    Object? bpSystolic = freezed,
    Object? bpDiastolic = freezed,
    Object? pulse = freezed,
    Object? temperatureC = freezed,
    Object? spo2 = freezed,
    Object? bloodSugar = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            consultationId: null == consultationId
                ? _value.consultationId
                : consultationId // ignore: cast_nullable_to_non_nullable
                      as int,
            weightKg: freezed == weightKg
                ? _value.weightKg
                : weightKg // ignore: cast_nullable_to_non_nullable
                      as double?,
            heightCm: freezed == heightCm
                ? _value.heightCm
                : heightCm // ignore: cast_nullable_to_non_nullable
                      as double?,
            bpSystolic: freezed == bpSystolic
                ? _value.bpSystolic
                : bpSystolic // ignore: cast_nullable_to_non_nullable
                      as int?,
            bpDiastolic: freezed == bpDiastolic
                ? _value.bpDiastolic
                : bpDiastolic // ignore: cast_nullable_to_non_nullable
                      as int?,
            pulse: freezed == pulse
                ? _value.pulse
                : pulse // ignore: cast_nullable_to_non_nullable
                      as int?,
            temperatureC: freezed == temperatureC
                ? _value.temperatureC
                : temperatureC // ignore: cast_nullable_to_non_nullable
                      as double?,
            spo2: freezed == spo2
                ? _value.spo2
                : spo2 // ignore: cast_nullable_to_non_nullable
                      as int?,
            bloodSugar: freezed == bloodSugar
                ? _value.bloodSugar
                : bloodSugar // ignore: cast_nullable_to_non_nullable
                      as double?,
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
abstract class _$$VitalSignsImplCopyWith<$Res>
    implements $VitalSignsCopyWith<$Res> {
  factory _$$VitalSignsImplCopyWith(
    _$VitalSignsImpl value,
    $Res Function(_$VitalSignsImpl) then,
  ) = __$$VitalSignsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int consultationId,
    double? weightKg,
    double? heightCm,
    int? bpSystolic,
    int? bpDiastolic,
    int? pulse,
    double? temperatureC,
    int? spo2,
    double? bloodSugar,
    String? notes,
  });
}

/// @nodoc
class __$$VitalSignsImplCopyWithImpl<$Res>
    extends _$VitalSignsCopyWithImpl<$Res, _$VitalSignsImpl>
    implements _$$VitalSignsImplCopyWith<$Res> {
  __$$VitalSignsImplCopyWithImpl(
    _$VitalSignsImpl _value,
    $Res Function(_$VitalSignsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VitalSigns
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? consultationId = null,
    Object? weightKg = freezed,
    Object? heightCm = freezed,
    Object? bpSystolic = freezed,
    Object? bpDiastolic = freezed,
    Object? pulse = freezed,
    Object? temperatureC = freezed,
    Object? spo2 = freezed,
    Object? bloodSugar = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$VitalSignsImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        consultationId: null == consultationId
            ? _value.consultationId
            : consultationId // ignore: cast_nullable_to_non_nullable
                  as int,
        weightKg: freezed == weightKg
            ? _value.weightKg
            : weightKg // ignore: cast_nullable_to_non_nullable
                  as double?,
        heightCm: freezed == heightCm
            ? _value.heightCm
            : heightCm // ignore: cast_nullable_to_non_nullable
                  as double?,
        bpSystolic: freezed == bpSystolic
            ? _value.bpSystolic
            : bpSystolic // ignore: cast_nullable_to_non_nullable
                  as int?,
        bpDiastolic: freezed == bpDiastolic
            ? _value.bpDiastolic
            : bpDiastolic // ignore: cast_nullable_to_non_nullable
                  as int?,
        pulse: freezed == pulse
            ? _value.pulse
            : pulse // ignore: cast_nullable_to_non_nullable
                  as int?,
        temperatureC: freezed == temperatureC
            ? _value.temperatureC
            : temperatureC // ignore: cast_nullable_to_non_nullable
                  as double?,
        spo2: freezed == spo2
            ? _value.spo2
            : spo2 // ignore: cast_nullable_to_non_nullable
                  as int?,
        bloodSugar: freezed == bloodSugar
            ? _value.bloodSugar
            : bloodSugar // ignore: cast_nullable_to_non_nullable
                  as double?,
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
class _$VitalSignsImpl implements _VitalSigns {
  const _$VitalSignsImpl({
    required this.id,
    required this.consultationId,
    this.weightKg,
    this.heightCm,
    this.bpSystolic,
    this.bpDiastolic,
    this.pulse,
    this.temperatureC,
    this.spo2,
    this.bloodSugar,
    this.notes,
  });

  factory _$VitalSignsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VitalSignsImplFromJson(json);

  @override
  final int id;
  @override
  final int consultationId;
  @override
  final double? weightKg;
  @override
  final double? heightCm;
  @override
  final int? bpSystolic;
  @override
  final int? bpDiastolic;
  @override
  final int? pulse;
  @override
  final double? temperatureC;
  @override
  final int? spo2;
  @override
  final double? bloodSugar;
  @override
  final String? notes;

  @override
  String toString() {
    return 'VitalSigns(id: $id, consultationId: $consultationId, weightKg: $weightKg, heightCm: $heightCm, bpSystolic: $bpSystolic, bpDiastolic: $bpDiastolic, pulse: $pulse, temperatureC: $temperatureC, spo2: $spo2, bloodSugar: $bloodSugar, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VitalSignsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.consultationId, consultationId) ||
                other.consultationId == consultationId) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.bpSystolic, bpSystolic) ||
                other.bpSystolic == bpSystolic) &&
            (identical(other.bpDiastolic, bpDiastolic) ||
                other.bpDiastolic == bpDiastolic) &&
            (identical(other.pulse, pulse) || other.pulse == pulse) &&
            (identical(other.temperatureC, temperatureC) ||
                other.temperatureC == temperatureC) &&
            (identical(other.spo2, spo2) || other.spo2 == spo2) &&
            (identical(other.bloodSugar, bloodSugar) ||
                other.bloodSugar == bloodSugar) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    consultationId,
    weightKg,
    heightCm,
    bpSystolic,
    bpDiastolic,
    pulse,
    temperatureC,
    spo2,
    bloodSugar,
    notes,
  );

  /// Create a copy of VitalSigns
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VitalSignsImplCopyWith<_$VitalSignsImpl> get copyWith =>
      __$$VitalSignsImplCopyWithImpl<_$VitalSignsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VitalSignsImplToJson(this);
  }
}

abstract class _VitalSigns implements VitalSigns {
  const factory _VitalSigns({
    required final int id,
    required final int consultationId,
    final double? weightKg,
    final double? heightCm,
    final int? bpSystolic,
    final int? bpDiastolic,
    final int? pulse,
    final double? temperatureC,
    final int? spo2,
    final double? bloodSugar,
    final String? notes,
  }) = _$VitalSignsImpl;

  factory _VitalSigns.fromJson(Map<String, dynamic> json) =
      _$VitalSignsImpl.fromJson;

  @override
  int get id;
  @override
  int get consultationId;
  @override
  double? get weightKg;
  @override
  double? get heightCm;
  @override
  int? get bpSystolic;
  @override
  int? get bpDiastolic;
  @override
  int? get pulse;
  @override
  double? get temperatureC;
  @override
  int? get spo2;
  @override
  double? get bloodSugar;
  @override
  String? get notes;

  /// Create a copy of VitalSigns
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VitalSignsImplCopyWith<_$VitalSignsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
