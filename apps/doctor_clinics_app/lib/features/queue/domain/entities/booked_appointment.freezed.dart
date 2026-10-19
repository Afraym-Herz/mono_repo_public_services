// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booked_appointment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BookedAppointment {
  int get appointmentId => throw _privateConstructorUsedError;
  int get patientId => throw _privateConstructorUsedError;
  String get patientName => throw _privateConstructorUsedError;
  String? get patientPhone => throw _privateConstructorUsedError;
  String? get fileNumber => throw _privateConstructorUsedError;
  String get scheduledTime => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Create a copy of BookedAppointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookedAppointmentCopyWith<BookedAppointment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookedAppointmentCopyWith<$Res> {
  factory $BookedAppointmentCopyWith(
    BookedAppointment value,
    $Res Function(BookedAppointment) then,
  ) = _$BookedAppointmentCopyWithImpl<$Res, BookedAppointment>;
  @useResult
  $Res call({
    int appointmentId,
    int patientId,
    String patientName,
    String? patientPhone,
    String? fileNumber,
    String scheduledTime,
    String type,
  });
}

/// @nodoc
class _$BookedAppointmentCopyWithImpl<$Res, $Val extends BookedAppointment>
    implements $BookedAppointmentCopyWith<$Res> {
  _$BookedAppointmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookedAppointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? patientId = null,
    Object? patientName = null,
    Object? patientPhone = freezed,
    Object? fileNumber = freezed,
    Object? scheduledTime = null,
    Object? type = null,
  }) {
    return _then(
      _value.copyWith(
            appointmentId: null == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as int,
            patientId: null == patientId
                ? _value.patientId
                : patientId // ignore: cast_nullable_to_non_nullable
                      as int,
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
            scheduledTime: null == scheduledTime
                ? _value.scheduledTime
                : scheduledTime // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookedAppointmentImplCopyWith<$Res>
    implements $BookedAppointmentCopyWith<$Res> {
  factory _$$BookedAppointmentImplCopyWith(
    _$BookedAppointmentImpl value,
    $Res Function(_$BookedAppointmentImpl) then,
  ) = __$$BookedAppointmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int appointmentId,
    int patientId,
    String patientName,
    String? patientPhone,
    String? fileNumber,
    String scheduledTime,
    String type,
  });
}

/// @nodoc
class __$$BookedAppointmentImplCopyWithImpl<$Res>
    extends _$BookedAppointmentCopyWithImpl<$Res, _$BookedAppointmentImpl>
    implements _$$BookedAppointmentImplCopyWith<$Res> {
  __$$BookedAppointmentImplCopyWithImpl(
    _$BookedAppointmentImpl _value,
    $Res Function(_$BookedAppointmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookedAppointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? patientId = null,
    Object? patientName = null,
    Object? patientPhone = freezed,
    Object? fileNumber = freezed,
    Object? scheduledTime = null,
    Object? type = null,
  }) {
    return _then(
      _$BookedAppointmentImpl(
        appointmentId: null == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as int,
        patientId: null == patientId
            ? _value.patientId
            : patientId // ignore: cast_nullable_to_non_nullable
                  as int,
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
        scheduledTime: null == scheduledTime
            ? _value.scheduledTime
            : scheduledTime // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$BookedAppointmentImpl implements _BookedAppointment {
  const _$BookedAppointmentImpl({
    required this.appointmentId,
    required this.patientId,
    required this.patientName,
    this.patientPhone,
    this.fileNumber,
    required this.scheduledTime,
    required this.type,
  });

  @override
  final int appointmentId;
  @override
  final int patientId;
  @override
  final String patientName;
  @override
  final String? patientPhone;
  @override
  final String? fileNumber;
  @override
  final String scheduledTime;
  @override
  final String type;

  @override
  String toString() {
    return 'BookedAppointment(appointmentId: $appointmentId, patientId: $patientId, patientName: $patientName, patientPhone: $patientPhone, fileNumber: $fileNumber, scheduledTime: $scheduledTime, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookedAppointmentImpl &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.patientPhone, patientPhone) ||
                other.patientPhone == patientPhone) &&
            (identical(other.fileNumber, fileNumber) ||
                other.fileNumber == fileNumber) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    appointmentId,
    patientId,
    patientName,
    patientPhone,
    fileNumber,
    scheduledTime,
    type,
  );

  /// Create a copy of BookedAppointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookedAppointmentImplCopyWith<_$BookedAppointmentImpl> get copyWith =>
      __$$BookedAppointmentImplCopyWithImpl<_$BookedAppointmentImpl>(
        this,
        _$identity,
      );
}

abstract class _BookedAppointment implements BookedAppointment {
  const factory _BookedAppointment({
    required final int appointmentId,
    required final int patientId,
    required final String patientName,
    final String? patientPhone,
    final String? fileNumber,
    required final String scheduledTime,
    required final String type,
  }) = _$BookedAppointmentImpl;

  @override
  int get appointmentId;
  @override
  int get patientId;
  @override
  String get patientName;
  @override
  String? get patientPhone;
  @override
  String? get fileNumber;
  @override
  String get scheduledTime;
  @override
  String get type;

  /// Create a copy of BookedAppointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookedAppointmentImplCopyWith<_$BookedAppointmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
