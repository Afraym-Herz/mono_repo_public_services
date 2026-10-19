// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queue_board_row.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$QueueBoardRow {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QueueTicket ticket) ticket,
    required TResult Function(BookedAppointment appointment) booked,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QueueTicket ticket)? ticket,
    TResult? Function(BookedAppointment appointment)? booked,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QueueTicket ticket)? ticket,
    TResult Function(BookedAppointment appointment)? booked,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueueTicketRow value) ticket,
    required TResult Function(QueueBookedRow value) booked,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueueTicketRow value)? ticket,
    TResult? Function(QueueBookedRow value)? booked,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueueTicketRow value)? ticket,
    TResult Function(QueueBookedRow value)? booked,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueueBoardRowCopyWith<$Res> {
  factory $QueueBoardRowCopyWith(
    QueueBoardRow value,
    $Res Function(QueueBoardRow) then,
  ) = _$QueueBoardRowCopyWithImpl<$Res, QueueBoardRow>;
}

/// @nodoc
class _$QueueBoardRowCopyWithImpl<$Res, $Val extends QueueBoardRow>
    implements $QueueBoardRowCopyWith<$Res> {
  _$QueueBoardRowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QueueBoardRow
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$QueueTicketRowImplCopyWith<$Res> {
  factory _$$QueueTicketRowImplCopyWith(
    _$QueueTicketRowImpl value,
    $Res Function(_$QueueTicketRowImpl) then,
  ) = __$$QueueTicketRowImplCopyWithImpl<$Res>;
  @useResult
  $Res call({QueueTicket ticket});

  $QueueTicketCopyWith<$Res> get ticket;
}

/// @nodoc
class __$$QueueTicketRowImplCopyWithImpl<$Res>
    extends _$QueueBoardRowCopyWithImpl<$Res, _$QueueTicketRowImpl>
    implements _$$QueueTicketRowImplCopyWith<$Res> {
  __$$QueueTicketRowImplCopyWithImpl(
    _$QueueTicketRowImpl _value,
    $Res Function(_$QueueTicketRowImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QueueBoardRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ticket = null}) {
    return _then(
      _$QueueTicketRowImpl(
        null == ticket
            ? _value.ticket
            : ticket // ignore: cast_nullable_to_non_nullable
                  as QueueTicket,
      ),
    );
  }

  /// Create a copy of QueueBoardRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QueueTicketCopyWith<$Res> get ticket {
    return $QueueTicketCopyWith<$Res>(_value.ticket, (value) {
      return _then(_value.copyWith(ticket: value));
    });
  }
}

/// @nodoc

class _$QueueTicketRowImpl implements QueueTicketRow {
  const _$QueueTicketRowImpl(this.ticket);

  @override
  final QueueTicket ticket;

  @override
  String toString() {
    return 'QueueBoardRow.ticket(ticket: $ticket)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueueTicketRowImpl &&
            (identical(other.ticket, ticket) || other.ticket == ticket));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticket);

  /// Create a copy of QueueBoardRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueueTicketRowImplCopyWith<_$QueueTicketRowImpl> get copyWith =>
      __$$QueueTicketRowImplCopyWithImpl<_$QueueTicketRowImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QueueTicket ticket) ticket,
    required TResult Function(BookedAppointment appointment) booked,
  }) {
    return ticket(this.ticket);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QueueTicket ticket)? ticket,
    TResult? Function(BookedAppointment appointment)? booked,
  }) {
    return ticket?.call(this.ticket);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QueueTicket ticket)? ticket,
    TResult Function(BookedAppointment appointment)? booked,
    required TResult orElse(),
  }) {
    if (ticket != null) {
      return ticket(this.ticket);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueueTicketRow value) ticket,
    required TResult Function(QueueBookedRow value) booked,
  }) {
    return ticket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueueTicketRow value)? ticket,
    TResult? Function(QueueBookedRow value)? booked,
  }) {
    return ticket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueueTicketRow value)? ticket,
    TResult Function(QueueBookedRow value)? booked,
    required TResult orElse(),
  }) {
    if (ticket != null) {
      return ticket(this);
    }
    return orElse();
  }
}

abstract class QueueTicketRow implements QueueBoardRow {
  const factory QueueTicketRow(final QueueTicket ticket) = _$QueueTicketRowImpl;

  QueueTicket get ticket;

  /// Create a copy of QueueBoardRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueueTicketRowImplCopyWith<_$QueueTicketRowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QueueBookedRowImplCopyWith<$Res> {
  factory _$$QueueBookedRowImplCopyWith(
    _$QueueBookedRowImpl value,
    $Res Function(_$QueueBookedRowImpl) then,
  ) = __$$QueueBookedRowImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BookedAppointment appointment});

  $BookedAppointmentCopyWith<$Res> get appointment;
}

/// @nodoc
class __$$QueueBookedRowImplCopyWithImpl<$Res>
    extends _$QueueBoardRowCopyWithImpl<$Res, _$QueueBookedRowImpl>
    implements _$$QueueBookedRowImplCopyWith<$Res> {
  __$$QueueBookedRowImplCopyWithImpl(
    _$QueueBookedRowImpl _value,
    $Res Function(_$QueueBookedRowImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QueueBoardRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? appointment = null}) {
    return _then(
      _$QueueBookedRowImpl(
        null == appointment
            ? _value.appointment
            : appointment // ignore: cast_nullable_to_non_nullable
                  as BookedAppointment,
      ),
    );
  }

  /// Create a copy of QueueBoardRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookedAppointmentCopyWith<$Res> get appointment {
    return $BookedAppointmentCopyWith<$Res>(_value.appointment, (value) {
      return _then(_value.copyWith(appointment: value));
    });
  }
}

/// @nodoc

class _$QueueBookedRowImpl implements QueueBookedRow {
  const _$QueueBookedRowImpl(this.appointment);

  @override
  final BookedAppointment appointment;

  @override
  String toString() {
    return 'QueueBoardRow.booked(appointment: $appointment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueueBookedRowImpl &&
            (identical(other.appointment, appointment) ||
                other.appointment == appointment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appointment);

  /// Create a copy of QueueBoardRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueueBookedRowImplCopyWith<_$QueueBookedRowImpl> get copyWith =>
      __$$QueueBookedRowImplCopyWithImpl<_$QueueBookedRowImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QueueTicket ticket) ticket,
    required TResult Function(BookedAppointment appointment) booked,
  }) {
    return booked(appointment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QueueTicket ticket)? ticket,
    TResult? Function(BookedAppointment appointment)? booked,
  }) {
    return booked?.call(appointment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QueueTicket ticket)? ticket,
    TResult Function(BookedAppointment appointment)? booked,
    required TResult orElse(),
  }) {
    if (booked != null) {
      return booked(appointment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueueTicketRow value) ticket,
    required TResult Function(QueueBookedRow value) booked,
  }) {
    return booked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueueTicketRow value)? ticket,
    TResult? Function(QueueBookedRow value)? booked,
  }) {
    return booked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueueTicketRow value)? ticket,
    TResult Function(QueueBookedRow value)? booked,
    required TResult orElse(),
  }) {
    if (booked != null) {
      return booked(this);
    }
    return orElse();
  }
}

abstract class QueueBookedRow implements QueueBoardRow {
  const factory QueueBookedRow(final BookedAppointment appointment) =
      _$QueueBookedRowImpl;

  BookedAppointment get appointment;

  /// Create a copy of QueueBoardRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueueBookedRowImplCopyWith<_$QueueBookedRowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
