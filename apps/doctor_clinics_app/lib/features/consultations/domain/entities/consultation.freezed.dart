// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Consultation _$ConsultationFromJson(Map<String, dynamic> json) {
  return _Consultation.fromJson(json);
}

/// @nodoc
mixin _$Consultation {
  int get id => throw _privateConstructorUsedError;
  int get patientId => throw _privateConstructorUsedError;
  int? get queueEntryId => throw _privateConstructorUsedError;
  DateTime get visitDate => throw _privateConstructorUsedError;
  String? get chiefComplaint => throw _privateConstructorUsedError;
  String? get historyOfPresentIllness => throw _privateConstructorUsedError;
  String? get examinationNotes => throw _privateConstructorUsedError;
  String? get diagnosis => throw _privateConstructorUsedError;
  String? get treatmentPlan => throw _privateConstructorUsedError;
  DateTime? get followUpDate => throw _privateConstructorUsedError;
  String? get followUpNotes => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get createdBy => throw _privateConstructorUsedError;
  DateTime? get finalizedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this Consultation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsultationCopyWith<Consultation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationCopyWith<$Res> {
  factory $ConsultationCopyWith(
    Consultation value,
    $Res Function(Consultation) then,
  ) = _$ConsultationCopyWithImpl<$Res, Consultation>;
  @useResult
  $Res call({
    int id,
    int patientId,
    int? queueEntryId,
    DateTime visitDate,
    String? chiefComplaint,
    String? historyOfPresentIllness,
    String? examinationNotes,
    String? diagnosis,
    String? treatmentPlan,
    DateTime? followUpDate,
    String? followUpNotes,
    String status,
    int createdBy,
    DateTime? finalizedAt,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? deletedAt,
  });
}

/// @nodoc
class _$ConsultationCopyWithImpl<$Res, $Val extends Consultation>
    implements $ConsultationCopyWith<$Res> {
  _$ConsultationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? queueEntryId = freezed,
    Object? visitDate = null,
    Object? chiefComplaint = freezed,
    Object? historyOfPresentIllness = freezed,
    Object? examinationNotes = freezed,
    Object? diagnosis = freezed,
    Object? treatmentPlan = freezed,
    Object? followUpDate = freezed,
    Object? followUpNotes = freezed,
    Object? status = null,
    Object? createdBy = null,
    Object? finalizedAt = freezed,
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
            queueEntryId: freezed == queueEntryId
                ? _value.queueEntryId
                : queueEntryId // ignore: cast_nullable_to_non_nullable
                      as int?,
            visitDate: null == visitDate
                ? _value.visitDate
                : visitDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            chiefComplaint: freezed == chiefComplaint
                ? _value.chiefComplaint
                : chiefComplaint // ignore: cast_nullable_to_non_nullable
                      as String?,
            historyOfPresentIllness: freezed == historyOfPresentIllness
                ? _value.historyOfPresentIllness
                : historyOfPresentIllness // ignore: cast_nullable_to_non_nullable
                      as String?,
            examinationNotes: freezed == examinationNotes
                ? _value.examinationNotes
                : examinationNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            diagnosis: freezed == diagnosis
                ? _value.diagnosis
                : diagnosis // ignore: cast_nullable_to_non_nullable
                      as String?,
            treatmentPlan: freezed == treatmentPlan
                ? _value.treatmentPlan
                : treatmentPlan // ignore: cast_nullable_to_non_nullable
                      as String?,
            followUpDate: freezed == followUpDate
                ? _value.followUpDate
                : followUpDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            followUpNotes: freezed == followUpNotes
                ? _value.followUpNotes
                : followUpNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            createdBy: null == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                      as int,
            finalizedAt: freezed == finalizedAt
                ? _value.finalizedAt
                : finalizedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
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
abstract class _$$ConsultationImplCopyWith<$Res>
    implements $ConsultationCopyWith<$Res> {
  factory _$$ConsultationImplCopyWith(
    _$ConsultationImpl value,
    $Res Function(_$ConsultationImpl) then,
  ) = __$$ConsultationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int patientId,
    int? queueEntryId,
    DateTime visitDate,
    String? chiefComplaint,
    String? historyOfPresentIllness,
    String? examinationNotes,
    String? diagnosis,
    String? treatmentPlan,
    DateTime? followUpDate,
    String? followUpNotes,
    String status,
    int createdBy,
    DateTime? finalizedAt,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? deletedAt,
  });
}

/// @nodoc
class __$$ConsultationImplCopyWithImpl<$Res>
    extends _$ConsultationCopyWithImpl<$Res, _$ConsultationImpl>
    implements _$$ConsultationImplCopyWith<$Res> {
  __$$ConsultationImplCopyWithImpl(
    _$ConsultationImpl _value,
    $Res Function(_$ConsultationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? queueEntryId = freezed,
    Object? visitDate = null,
    Object? chiefComplaint = freezed,
    Object? historyOfPresentIllness = freezed,
    Object? examinationNotes = freezed,
    Object? diagnosis = freezed,
    Object? treatmentPlan = freezed,
    Object? followUpDate = freezed,
    Object? followUpNotes = freezed,
    Object? status = null,
    Object? createdBy = null,
    Object? finalizedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _$ConsultationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        patientId: null == patientId
            ? _value.patientId
            : patientId // ignore: cast_nullable_to_non_nullable
                  as int,
        queueEntryId: freezed == queueEntryId
            ? _value.queueEntryId
            : queueEntryId // ignore: cast_nullable_to_non_nullable
                  as int?,
        visitDate: null == visitDate
            ? _value.visitDate
            : visitDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        chiefComplaint: freezed == chiefComplaint
            ? _value.chiefComplaint
            : chiefComplaint // ignore: cast_nullable_to_non_nullable
                  as String?,
        historyOfPresentIllness: freezed == historyOfPresentIllness
            ? _value.historyOfPresentIllness
            : historyOfPresentIllness // ignore: cast_nullable_to_non_nullable
                  as String?,
        examinationNotes: freezed == examinationNotes
            ? _value.examinationNotes
            : examinationNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        diagnosis: freezed == diagnosis
            ? _value.diagnosis
            : diagnosis // ignore: cast_nullable_to_non_nullable
                  as String?,
        treatmentPlan: freezed == treatmentPlan
            ? _value.treatmentPlan
            : treatmentPlan // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUpDate: freezed == followUpDate
            ? _value.followUpDate
            : followUpDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        followUpNotes: freezed == followUpNotes
            ? _value.followUpNotes
            : followUpNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        createdBy: null == createdBy
            ? _value.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as int,
        finalizedAt: freezed == finalizedAt
            ? _value.finalizedAt
            : finalizedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
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
class _$ConsultationImpl implements _Consultation {
  const _$ConsultationImpl({
    required this.id,
    required this.patientId,
    this.queueEntryId,
    required this.visitDate,
    this.chiefComplaint,
    this.historyOfPresentIllness,
    this.examinationNotes,
    this.diagnosis,
    this.treatmentPlan,
    this.followUpDate,
    this.followUpNotes,
    required this.status,
    required this.createdBy,
    this.finalizedAt,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory _$ConsultationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultationImplFromJson(json);

  @override
  final int id;
  @override
  final int patientId;
  @override
  final int? queueEntryId;
  @override
  final DateTime visitDate;
  @override
  final String? chiefComplaint;
  @override
  final String? historyOfPresentIllness;
  @override
  final String? examinationNotes;
  @override
  final String? diagnosis;
  @override
  final String? treatmentPlan;
  @override
  final DateTime? followUpDate;
  @override
  final String? followUpNotes;
  @override
  final String status;
  @override
  final int createdBy;
  @override
  final DateTime? finalizedAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Consultation(id: $id, patientId: $patientId, queueEntryId: $queueEntryId, visitDate: $visitDate, chiefComplaint: $chiefComplaint, historyOfPresentIllness: $historyOfPresentIllness, examinationNotes: $examinationNotes, diagnosis: $diagnosis, treatmentPlan: $treatmentPlan, followUpDate: $followUpDate, followUpNotes: $followUpNotes, status: $status, createdBy: $createdBy, finalizedAt: $finalizedAt, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.queueEntryId, queueEntryId) ||
                other.queueEntryId == queueEntryId) &&
            (identical(other.visitDate, visitDate) ||
                other.visitDate == visitDate) &&
            (identical(other.chiefComplaint, chiefComplaint) ||
                other.chiefComplaint == chiefComplaint) &&
            (identical(
                  other.historyOfPresentIllness,
                  historyOfPresentIllness,
                ) ||
                other.historyOfPresentIllness == historyOfPresentIllness) &&
            (identical(other.examinationNotes, examinationNotes) ||
                other.examinationNotes == examinationNotes) &&
            (identical(other.diagnosis, diagnosis) ||
                other.diagnosis == diagnosis) &&
            (identical(other.treatmentPlan, treatmentPlan) ||
                other.treatmentPlan == treatmentPlan) &&
            (identical(other.followUpDate, followUpDate) ||
                other.followUpDate == followUpDate) &&
            (identical(other.followUpNotes, followUpNotes) ||
                other.followUpNotes == followUpNotes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.finalizedAt, finalizedAt) ||
                other.finalizedAt == finalizedAt) &&
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
    queueEntryId,
    visitDate,
    chiefComplaint,
    historyOfPresentIllness,
    examinationNotes,
    diagnosis,
    treatmentPlan,
    followUpDate,
    followUpNotes,
    status,
    createdBy,
    finalizedAt,
    createdAt,
    updatedAt,
    deletedAt,
  );

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationImplCopyWith<_$ConsultationImpl> get copyWith =>
      __$$ConsultationImplCopyWithImpl<_$ConsultationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultationImplToJson(this);
  }
}

abstract class _Consultation implements Consultation {
  const factory _Consultation({
    required final int id,
    required final int patientId,
    final int? queueEntryId,
    required final DateTime visitDate,
    final String? chiefComplaint,
    final String? historyOfPresentIllness,
    final String? examinationNotes,
    final String? diagnosis,
    final String? treatmentPlan,
    final DateTime? followUpDate,
    final String? followUpNotes,
    required final String status,
    required final int createdBy,
    final DateTime? finalizedAt,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final DateTime? deletedAt,
  }) = _$ConsultationImpl;

  factory _Consultation.fromJson(Map<String, dynamic> json) =
      _$ConsultationImpl.fromJson;

  @override
  int get id;
  @override
  int get patientId;
  @override
  int? get queueEntryId;
  @override
  DateTime get visitDate;
  @override
  String? get chiefComplaint;
  @override
  String? get historyOfPresentIllness;
  @override
  String? get examinationNotes;
  @override
  String? get diagnosis;
  @override
  String? get treatmentPlan;
  @override
  DateTime? get followUpDate;
  @override
  String? get followUpNotes;
  @override
  String get status;
  @override
  int get createdBy;
  @override
  DateTime? get finalizedAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsultationImplCopyWith<_$ConsultationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
