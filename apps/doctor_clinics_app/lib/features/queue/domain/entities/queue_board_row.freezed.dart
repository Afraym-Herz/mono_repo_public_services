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
  QueueTicket get ticket => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QueueTicket ticket) ticket,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QueueTicket ticket)? ticket,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QueueTicket ticket)? ticket,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueueTicketRow value) ticket,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueueTicketRow value)? ticket,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueueTicketRow value)? ticket,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of QueueBoardRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QueueBoardRowCopyWith<QueueBoardRow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueueBoardRowCopyWith<$Res> {
  factory $QueueBoardRowCopyWith(
    QueueBoardRow value,
    $Res Function(QueueBoardRow) then,
  ) = _$QueueBoardRowCopyWithImpl<$Res, QueueBoardRow>;
  @useResult
  $Res call({QueueTicket ticket});

  $QueueTicketCopyWith<$Res> get ticket;
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ticket = null}) {
    return _then(
      _value.copyWith(
            ticket: null == ticket
                ? _value.ticket
                : ticket // ignore: cast_nullable_to_non_nullable
                      as QueueTicket,
          )
          as $Val,
    );
  }

  /// Create a copy of QueueBoardRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QueueTicketCopyWith<$Res> get ticket {
    return $QueueTicketCopyWith<$Res>(_value.ticket, (value) {
      return _then(_value.copyWith(ticket: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QueueTicketRowImplCopyWith<$Res>
    implements $QueueBoardRowCopyWith<$Res> {
  factory _$$QueueTicketRowImplCopyWith(
    _$QueueTicketRowImpl value,
    $Res Function(_$QueueTicketRowImpl) then,
  ) = __$$QueueTicketRowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({QueueTicket ticket});

  @override
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
  }) {
    return ticket(this.ticket);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QueueTicket ticket)? ticket,
  }) {
    return ticket?.call(this.ticket);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QueueTicket ticket)? ticket,
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
  }) {
    return ticket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueueTicketRow value)? ticket,
  }) {
    return ticket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueueTicketRow value)? ticket,
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

  @override
  QueueTicket get ticket;

  /// Create a copy of QueueBoardRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueueTicketRowImplCopyWith<_$QueueTicketRowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
