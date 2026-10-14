// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PrescriptionItem _$PrescriptionItemFromJson(Map<String, dynamic> json) {
  return _PrescriptionItem.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionItem {
  int get id => throw _privateConstructorUsedError;
  int get prescriptionId => throw _privateConstructorUsedError;
  int get medicineId => throw _privateConstructorUsedError;
  String get medicineName => throw _privateConstructorUsedError;
  String get dosage => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;
  String? get instructions => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this PrescriptionItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrescriptionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionItemCopyWith<PrescriptionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionItemCopyWith<$Res> {
  factory $PrescriptionItemCopyWith(
    PrescriptionItem value,
    $Res Function(PrescriptionItem) then,
  ) = _$PrescriptionItemCopyWithImpl<$Res, PrescriptionItem>;
  @useResult
  $Res call({
    int id,
    int prescriptionId,
    int medicineId,
    String medicineName,
    String dosage,
    String frequency,
    String duration,
    String? instructions,
    String? notes,
  });
}

/// @nodoc
class _$PrescriptionItemCopyWithImpl<$Res, $Val extends PrescriptionItem>
    implements $PrescriptionItemCopyWith<$Res> {
  _$PrescriptionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrescriptionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prescriptionId = null,
    Object? medicineId = null,
    Object? medicineName = null,
    Object? dosage = null,
    Object? frequency = null,
    Object? duration = null,
    Object? instructions = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            prescriptionId: null == prescriptionId
                ? _value.prescriptionId
                : prescriptionId // ignore: cast_nullable_to_non_nullable
                      as int,
            medicineId: null == medicineId
                ? _value.medicineId
                : medicineId // ignore: cast_nullable_to_non_nullable
                      as int,
            medicineName: null == medicineName
                ? _value.medicineName
                : medicineName // ignore: cast_nullable_to_non_nullable
                      as String,
            dosage: null == dosage
                ? _value.dosage
                : dosage // ignore: cast_nullable_to_non_nullable
                      as String,
            frequency: null == frequency
                ? _value.frequency
                : frequency // ignore: cast_nullable_to_non_nullable
                      as String,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as String,
            instructions: freezed == instructions
                ? _value.instructions
                : instructions // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PrescriptionItemImplCopyWith<$Res>
    implements $PrescriptionItemCopyWith<$Res> {
  factory _$$PrescriptionItemImplCopyWith(
    _$PrescriptionItemImpl value,
    $Res Function(_$PrescriptionItemImpl) then,
  ) = __$$PrescriptionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int prescriptionId,
    int medicineId,
    String medicineName,
    String dosage,
    String frequency,
    String duration,
    String? instructions,
    String? notes,
  });
}

/// @nodoc
class __$$PrescriptionItemImplCopyWithImpl<$Res>
    extends _$PrescriptionItemCopyWithImpl<$Res, _$PrescriptionItemImpl>
    implements _$$PrescriptionItemImplCopyWith<$Res> {
  __$$PrescriptionItemImplCopyWithImpl(
    _$PrescriptionItemImpl _value,
    $Res Function(_$PrescriptionItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrescriptionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prescriptionId = null,
    Object? medicineId = null,
    Object? medicineName = null,
    Object? dosage = null,
    Object? frequency = null,
    Object? duration = null,
    Object? instructions = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$PrescriptionItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        prescriptionId: null == prescriptionId
            ? _value.prescriptionId
            : prescriptionId // ignore: cast_nullable_to_non_nullable
                  as int,
        medicineId: null == medicineId
            ? _value.medicineId
            : medicineId // ignore: cast_nullable_to_non_nullable
                  as int,
        medicineName: null == medicineName
            ? _value.medicineName
            : medicineName // ignore: cast_nullable_to_non_nullable
                  as String,
        dosage: null == dosage
            ? _value.dosage
            : dosage // ignore: cast_nullable_to_non_nullable
                  as String,
        frequency: null == frequency
            ? _value.frequency
            : frequency // ignore: cast_nullable_to_non_nullable
                  as String,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String,
        instructions: freezed == instructions
            ? _value.instructions
            : instructions // ignore: cast_nullable_to_non_nullable
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
class _$PrescriptionItemImpl implements _PrescriptionItem {
  const _$PrescriptionItemImpl({
    required this.id,
    required this.prescriptionId,
    required this.medicineId,
    required this.medicineName,
    required this.dosage,
    required this.frequency,
    required this.duration,
    this.instructions,
    this.notes,
  });

  factory _$PrescriptionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionItemImplFromJson(json);

  @override
  final int id;
  @override
  final int prescriptionId;
  @override
  final int medicineId;
  @override
  final String medicineName;
  @override
  final String dosage;
  @override
  final String frequency;
  @override
  final String duration;
  @override
  final String? instructions;
  @override
  final String? notes;

  @override
  String toString() {
    return 'PrescriptionItem(id: $id, prescriptionId: $prescriptionId, medicineId: $medicineId, medicineName: $medicineName, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prescriptionId, prescriptionId) ||
                other.prescriptionId == prescriptionId) &&
            (identical(other.medicineId, medicineId) ||
                other.medicineId == medicineId) &&
            (identical(other.medicineName, medicineName) ||
                other.medicineName == medicineName) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    prescriptionId,
    medicineId,
    medicineName,
    dosage,
    frequency,
    duration,
    instructions,
    notes,
  );

  /// Create a copy of PrescriptionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionItemImplCopyWith<_$PrescriptionItemImpl> get copyWith =>
      __$$PrescriptionItemImplCopyWithImpl<_$PrescriptionItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionItemImplToJson(this);
  }
}

abstract class _PrescriptionItem implements PrescriptionItem {
  const factory _PrescriptionItem({
    required final int id,
    required final int prescriptionId,
    required final int medicineId,
    required final String medicineName,
    required final String dosage,
    required final String frequency,
    required final String duration,
    final String? instructions,
    final String? notes,
  }) = _$PrescriptionItemImpl;

  factory _PrescriptionItem.fromJson(Map<String, dynamic> json) =
      _$PrescriptionItemImpl.fromJson;

  @override
  int get id;
  @override
  int get prescriptionId;
  @override
  int get medicineId;
  @override
  String get medicineName;
  @override
  String get dosage;
  @override
  String get frequency;
  @override
  String get duration;
  @override
  String? get instructions;
  @override
  String? get notes;

  /// Create a copy of PrescriptionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionItemImplCopyWith<_$PrescriptionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
