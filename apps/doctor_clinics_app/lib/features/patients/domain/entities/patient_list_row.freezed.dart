// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_list_row.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PatientListRow {
  Patient get patient => throw _privateConstructorUsedError;
  DateTime? get lastVisit => throw _privateConstructorUsedError;
  DateTime? get followUpDate => throw _privateConstructorUsedError;
  int get debtPiasters => throw _privateConstructorUsedError;

  /// Create a copy of PatientListRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientListRowCopyWith<PatientListRow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientListRowCopyWith<$Res> {
  factory $PatientListRowCopyWith(
    PatientListRow value,
    $Res Function(PatientListRow) then,
  ) = _$PatientListRowCopyWithImpl<$Res, PatientListRow>;
  @useResult
  $Res call({
    Patient patient,
    DateTime? lastVisit,
    DateTime? followUpDate,
    int debtPiasters,
  });

  $PatientCopyWith<$Res> get patient;
}

/// @nodoc
class _$PatientListRowCopyWithImpl<$Res, $Val extends PatientListRow>
    implements $PatientListRowCopyWith<$Res> {
  _$PatientListRowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientListRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patient = null,
    Object? lastVisit = freezed,
    Object? followUpDate = freezed,
    Object? debtPiasters = null,
  }) {
    return _then(
      _value.copyWith(
            patient: null == patient
                ? _value.patient
                : patient // ignore: cast_nullable_to_non_nullable
                      as Patient,
            lastVisit: freezed == lastVisit
                ? _value.lastVisit
                : lastVisit // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            followUpDate: freezed == followUpDate
                ? _value.followUpDate
                : followUpDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            debtPiasters: null == debtPiasters
                ? _value.debtPiasters
                : debtPiasters // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of PatientListRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PatientCopyWith<$Res> get patient {
    return $PatientCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PatientListRowImplCopyWith<$Res>
    implements $PatientListRowCopyWith<$Res> {
  factory _$$PatientListRowImplCopyWith(
    _$PatientListRowImpl value,
    $Res Function(_$PatientListRowImpl) then,
  ) = __$$PatientListRowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Patient patient,
    DateTime? lastVisit,
    DateTime? followUpDate,
    int debtPiasters,
  });

  @override
  $PatientCopyWith<$Res> get patient;
}

/// @nodoc
class __$$PatientListRowImplCopyWithImpl<$Res>
    extends _$PatientListRowCopyWithImpl<$Res, _$PatientListRowImpl>
    implements _$$PatientListRowImplCopyWith<$Res> {
  __$$PatientListRowImplCopyWithImpl(
    _$PatientListRowImpl _value,
    $Res Function(_$PatientListRowImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientListRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patient = null,
    Object? lastVisit = freezed,
    Object? followUpDate = freezed,
    Object? debtPiasters = null,
  }) {
    return _then(
      _$PatientListRowImpl(
        patient: null == patient
            ? _value.patient
            : patient // ignore: cast_nullable_to_non_nullable
                  as Patient,
        lastVisit: freezed == lastVisit
            ? _value.lastVisit
            : lastVisit // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        followUpDate: freezed == followUpDate
            ? _value.followUpDate
            : followUpDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        debtPiasters: null == debtPiasters
            ? _value.debtPiasters
            : debtPiasters // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$PatientListRowImpl implements _PatientListRow {
  const _$PatientListRowImpl({
    required this.patient,
    this.lastVisit,
    this.followUpDate,
    this.debtPiasters = 0,
  });

  @override
  final Patient patient;
  @override
  final DateTime? lastVisit;
  @override
  final DateTime? followUpDate;
  @override
  @JsonKey()
  final int debtPiasters;

  @override
  String toString() {
    return 'PatientListRow(patient: $patient, lastVisit: $lastVisit, followUpDate: $followUpDate, debtPiasters: $debtPiasters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientListRowImpl &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.lastVisit, lastVisit) ||
                other.lastVisit == lastVisit) &&
            (identical(other.followUpDate, followUpDate) ||
                other.followUpDate == followUpDate) &&
            (identical(other.debtPiasters, debtPiasters) ||
                other.debtPiasters == debtPiasters));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, patient, lastVisit, followUpDate, debtPiasters);

  /// Create a copy of PatientListRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientListRowImplCopyWith<_$PatientListRowImpl> get copyWith =>
      __$$PatientListRowImplCopyWithImpl<_$PatientListRowImpl>(
        this,
        _$identity,
      );
}

abstract class _PatientListRow implements PatientListRow {
  const factory _PatientListRow({
    required final Patient patient,
    final DateTime? lastVisit,
    final DateTime? followUpDate,
    final int debtPiasters,
  }) = _$PatientListRowImpl;

  @override
  Patient get patient;
  @override
  DateTime? get lastVisit;
  @override
  DateTime? get followUpDate;
  @override
  int get debtPiasters;

  /// Create a copy of PatientListRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientListRowImplCopyWith<_$PatientListRowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
