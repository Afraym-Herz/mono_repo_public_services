// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queue_ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$QueueTicket {
  int get entryId => throw _privateConstructorUsedError;
  int? get appointmentId => throw _privateConstructorUsedError;
  int get patientId => throw _privateConstructorUsedError;
  int get queueNumber => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  QueueStatus get status => throw _privateConstructorUsedError;
  bool get isUrgent => throw _privateConstructorUsedError;
  DateTime get arrivedAt => throw _privateConstructorUsedError;
  DateTime? get calledAt => throw _privateConstructorUsedError;
  DateTime? get finishedAt => throw _privateConstructorUsedError;
  String get patientName => throw _privateConstructorUsedError;
  String? get patientPhone => throw _privateConstructorUsedError;
  String? get fileNumber => throw _privateConstructorUsedError;
  String? get appointmentType => throw _privateConstructorUsedError;
  String? get scheduledTime => throw _privateConstructorUsedError;
  DateTime? get paidAt => throw _privateConstructorUsedError;
  int? get paidAmountPiasters => throw _privateConstructorUsedError;
  String? get cancelReason => throw _privateConstructorUsedError;

  /// Create a copy of QueueTicket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QueueTicketCopyWith<QueueTicket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueueTicketCopyWith<$Res> {
  factory $QueueTicketCopyWith(
    QueueTicket value,
    $Res Function(QueueTicket) then,
  ) = _$QueueTicketCopyWithImpl<$Res, QueueTicket>;
  @useResult
  $Res call({
    int entryId,
    int? appointmentId,
    int patientId,
    int queueNumber,
    int position,
    QueueStatus status,
    bool isUrgent,
    DateTime arrivedAt,
    DateTime? calledAt,
    DateTime? finishedAt,
    String patientName,
    String? patientPhone,
    String? fileNumber,
    String? appointmentType,
    String? scheduledTime,
    DateTime? paidAt,
    int? paidAmountPiasters,
    String? cancelReason,
  });
}

/// @nodoc
class _$QueueTicketCopyWithImpl<$Res, $Val extends QueueTicket>
    implements $QueueTicketCopyWith<$Res> {
  _$QueueTicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QueueTicket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryId = null,
    Object? appointmentId = freezed,
    Object? patientId = null,
    Object? queueNumber = null,
    Object? position = null,
    Object? status = null,
    Object? isUrgent = null,
    Object? arrivedAt = null,
    Object? calledAt = freezed,
    Object? finishedAt = freezed,
    Object? patientName = null,
    Object? patientPhone = freezed,
    Object? fileNumber = freezed,
    Object? appointmentType = freezed,
    Object? scheduledTime = freezed,
    Object? paidAt = freezed,
    Object? paidAmountPiasters = freezed,
    Object? cancelReason = freezed,
  }) {
    return _then(
      _value.copyWith(
            entryId: null == entryId
                ? _value.entryId
                : entryId // ignore: cast_nullable_to_non_nullable
                      as int,
            appointmentId: freezed == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as int?,
            patientId: null == patientId
                ? _value.patientId
                : patientId // ignore: cast_nullable_to_non_nullable
                      as int,
            queueNumber: null == queueNumber
                ? _value.queueNumber
                : queueNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            position: null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as QueueStatus,
            isUrgent: null == isUrgent
                ? _value.isUrgent
                : isUrgent // ignore: cast_nullable_to_non_nullable
                      as bool,
            arrivedAt: null == arrivedAt
                ? _value.arrivedAt
                : arrivedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            calledAt: freezed == calledAt
                ? _value.calledAt
                : calledAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            finishedAt: freezed == finishedAt
                ? _value.finishedAt
                : finishedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            patientName: null == patientName
                ? _value.patientName
                : patientName // ignore: cast_nullable_to_non_nullable
                      as String,
            patientPhone: freezed == patientPhone
                ? _value.patientPhone
                : patientPhone // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileNumber: freezed == fileNumber
                ? _value.fileNumber
                : fileNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointmentType: freezed == appointmentType
                ? _value.appointmentType
                : appointmentType // ignore: cast_nullable_to_non_nullable
                      as String?,
            scheduledTime: freezed == scheduledTime
                ? _value.scheduledTime
                : scheduledTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            paidAt: freezed == paidAt
                ? _value.paidAt
                : paidAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            paidAmountPiasters: freezed == paidAmountPiasters
                ? _value.paidAmountPiasters
                : paidAmountPiasters // ignore: cast_nullable_to_non_nullable
                      as int?,
            cancelReason: freezed == cancelReason
                ? _value.cancelReason
                : cancelReason // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QueueTicketImplCopyWith<$Res>
    implements $QueueTicketCopyWith<$Res> {
  factory _$$QueueTicketImplCopyWith(
    _$QueueTicketImpl value,
    $Res Function(_$QueueTicketImpl) then,
  ) = __$$QueueTicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int entryId,
    int? appointmentId,
    int patientId,
    int queueNumber,
    int position,
    QueueStatus status,
    bool isUrgent,
    DateTime arrivedAt,
    DateTime? calledAt,
    DateTime? finishedAt,
    String patientName,
    String? patientPhone,
    String? fileNumber,
    String? appointmentType,
    String? scheduledTime,
    DateTime? paidAt,
    int? paidAmountPiasters,
    String? cancelReason,
  });
}

/// @nodoc
class __$$QueueTicketImplCopyWithImpl<$Res>
    extends _$QueueTicketCopyWithImpl<$Res, _$QueueTicketImpl>
    implements _$$QueueTicketImplCopyWith<$Res> {
  __$$QueueTicketImplCopyWithImpl(
    _$QueueTicketImpl _value,
    $Res Function(_$QueueTicketImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QueueTicket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryId = null,
    Object? appointmentId = freezed,
    Object? patientId = null,
    Object? queueNumber = null,
    Object? position = null,
    Object? status = null,
    Object? isUrgent = null,
    Object? arrivedAt = null,
    Object? calledAt = freezed,
    Object? finishedAt = freezed,
    Object? patientName = null,
    Object? patientPhone = freezed,
    Object? fileNumber = freezed,
    Object? appointmentType = freezed,
    Object? scheduledTime = freezed,
    Object? paidAt = freezed,
    Object? paidAmountPiasters = freezed,
    Object? cancelReason = freezed,
  }) {
    return _then(
      _$QueueTicketImpl(
        entryId: null == entryId
            ? _value.entryId
            : entryId // ignore: cast_nullable_to_non_nullable
                  as int,
        appointmentId: freezed == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as int?,
        patientId: null == patientId
            ? _value.patientId
            : patientId // ignore: cast_nullable_to_non_nullable
                  as int,
        queueNumber: null == queueNumber
            ? _value.queueNumber
            : queueNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        position: null == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as QueueStatus,
        isUrgent: null == isUrgent
            ? _value.isUrgent
            : isUrgent // ignore: cast_nullable_to_non_nullable
                  as bool,
        arrivedAt: null == arrivedAt
            ? _value.arrivedAt
            : arrivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        calledAt: freezed == calledAt
            ? _value.calledAt
            : calledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        finishedAt: freezed == finishedAt
            ? _value.finishedAt
            : finishedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        patientName: null == patientName
            ? _value.patientName
            : patientName // ignore: cast_nullable_to_non_nullable
                  as String,
        patientPhone: freezed == patientPhone
            ? _value.patientPhone
            : patientPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileNumber: freezed == fileNumber
            ? _value.fileNumber
            : fileNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointmentType: freezed == appointmentType
            ? _value.appointmentType
            : appointmentType // ignore: cast_nullable_to_non_nullable
                  as String?,
        scheduledTime: freezed == scheduledTime
            ? _value.scheduledTime
            : scheduledTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        paidAt: freezed == paidAt
            ? _value.paidAt
            : paidAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        paidAmountPiasters: freezed == paidAmountPiasters
            ? _value.paidAmountPiasters
            : paidAmountPiasters // ignore: cast_nullable_to_non_nullable
                  as int?,
        cancelReason: freezed == cancelReason
            ? _value.cancelReason
            : cancelReason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$QueueTicketImpl extends _QueueTicket {
  const _$QueueTicketImpl({
    required this.entryId,
    this.appointmentId,
    required this.patientId,
    required this.queueNumber,
    required this.position,
    required this.status,
    required this.isUrgent,
    required this.arrivedAt,
    this.calledAt,
    this.finishedAt,
    required this.patientName,
    this.patientPhone,
    this.fileNumber,
    this.appointmentType,
    this.scheduledTime,
    this.paidAt,
    this.paidAmountPiasters,
    this.cancelReason,
  }) : super._();

  @override
  final int entryId;
  @override
  final int? appointmentId;
  @override
  final int patientId;
  @override
  final int queueNumber;
  @override
  final int position;
  @override
  final QueueStatus status;
  @override
  final bool isUrgent;
  @override
  final DateTime arrivedAt;
  @override
  final DateTime? calledAt;
  @override
  final DateTime? finishedAt;
  @override
  final String patientName;
  @override
  final String? patientPhone;
  @override
  final String? fileNumber;
  @override
  final String? appointmentType;
  @override
  final String? scheduledTime;
  @override
  final DateTime? paidAt;
  @override
  final int? paidAmountPiasters;
  @override
  final String? cancelReason;

  @override
  String toString() {
    return 'QueueTicket(entryId: $entryId, appointmentId: $appointmentId, patientId: $patientId, queueNumber: $queueNumber, position: $position, status: $status, isUrgent: $isUrgent, arrivedAt: $arrivedAt, calledAt: $calledAt, finishedAt: $finishedAt, patientName: $patientName, patientPhone: $patientPhone, fileNumber: $fileNumber, appointmentType: $appointmentType, scheduledTime: $scheduledTime, paidAt: $paidAt, paidAmountPiasters: $paidAmountPiasters, cancelReason: $cancelReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueueTicketImpl &&
            (identical(other.entryId, entryId) || other.entryId == entryId) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.queueNumber, queueNumber) ||
                other.queueNumber == queueNumber) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isUrgent, isUrgent) ||
                other.isUrgent == isUrgent) &&
            (identical(other.arrivedAt, arrivedAt) ||
                other.arrivedAt == arrivedAt) &&
            (identical(other.calledAt, calledAt) ||
                other.calledAt == calledAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.patientPhone, patientPhone) ||
                other.patientPhone == patientPhone) &&
            (identical(other.fileNumber, fileNumber) ||
                other.fileNumber == fileNumber) &&
            (identical(other.appointmentType, appointmentType) ||
                other.appointmentType == appointmentType) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.paidAmountPiasters, paidAmountPiasters) ||
                other.paidAmountPiasters == paidAmountPiasters) &&
            (identical(other.cancelReason, cancelReason) ||
                other.cancelReason == cancelReason));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    entryId,
    appointmentId,
    patientId,
    queueNumber,
    position,
    status,
    isUrgent,
    arrivedAt,
    calledAt,
    finishedAt,
    patientName,
    patientPhone,
    fileNumber,
    appointmentType,
    scheduledTime,
    paidAt,
    paidAmountPiasters,
    cancelReason,
  );

  /// Create a copy of QueueTicket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueueTicketImplCopyWith<_$QueueTicketImpl> get copyWith =>
      __$$QueueTicketImplCopyWithImpl<_$QueueTicketImpl>(this, _$identity);
}

abstract class _QueueTicket extends QueueTicket {
  const factory _QueueTicket({
    required final int entryId,
    final int? appointmentId,
    required final int patientId,
    required final int queueNumber,
    required final int position,
    required final QueueStatus status,
    required final bool isUrgent,
    required final DateTime arrivedAt,
    final DateTime? calledAt,
    final DateTime? finishedAt,
    required final String patientName,
    final String? patientPhone,
    final String? fileNumber,
    final String? appointmentType,
    final String? scheduledTime,
    final DateTime? paidAt,
    final int? paidAmountPiasters,
    final String? cancelReason,
  }) = _$QueueTicketImpl;
  const _QueueTicket._() : super._();

  @override
  int get entryId;
  @override
  int? get appointmentId;
  @override
  int get patientId;
  @override
  int get queueNumber;
  @override
  int get position;
  @override
  QueueStatus get status;
  @override
  bool get isUrgent;
  @override
  DateTime get arrivedAt;
  @override
  DateTime? get calledAt;
  @override
  DateTime? get finishedAt;
  @override
  String get patientName;
  @override
  String? get patientPhone;
  @override
  String? get fileNumber;
  @override
  String? get appointmentType;
  @override
  String? get scheduledTime;
  @override
  DateTime? get paidAt;
  @override
  int? get paidAmountPiasters;
  @override
  String? get cancelReason;

  /// Create a copy of QueueTicket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueueTicketImplCopyWith<_$QueueTicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
