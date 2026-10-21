// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queue_board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$QueueBoard {
  List<QueueTicket> get tickets => throw _privateConstructorUsedError;

  /// Create a copy of QueueBoard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QueueBoardCopyWith<QueueBoard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueueBoardCopyWith<$Res> {
  factory $QueueBoardCopyWith(
    QueueBoard value,
    $Res Function(QueueBoard) then,
  ) = _$QueueBoardCopyWithImpl<$Res, QueueBoard>;
  @useResult
  $Res call({List<QueueTicket> tickets});
}

/// @nodoc
class _$QueueBoardCopyWithImpl<$Res, $Val extends QueueBoard>
    implements $QueueBoardCopyWith<$Res> {
  _$QueueBoardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QueueBoard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tickets = null}) {
    return _then(
      _value.copyWith(
            tickets: null == tickets
                ? _value.tickets
                : tickets // ignore: cast_nullable_to_non_nullable
                      as List<QueueTicket>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QueueBoardImplCopyWith<$Res>
    implements $QueueBoardCopyWith<$Res> {
  factory _$$QueueBoardImplCopyWith(
    _$QueueBoardImpl value,
    $Res Function(_$QueueBoardImpl) then,
  ) = __$$QueueBoardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<QueueTicket> tickets});
}

/// @nodoc
class __$$QueueBoardImplCopyWithImpl<$Res>
    extends _$QueueBoardCopyWithImpl<$Res, _$QueueBoardImpl>
    implements _$$QueueBoardImplCopyWith<$Res> {
  __$$QueueBoardImplCopyWithImpl(
    _$QueueBoardImpl _value,
    $Res Function(_$QueueBoardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QueueBoard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tickets = null}) {
    return _then(
      _$QueueBoardImpl(
        tickets: null == tickets
            ? _value._tickets
            : tickets // ignore: cast_nullable_to_non_nullable
                  as List<QueueTicket>,
      ),
    );
  }
}

/// @nodoc

class _$QueueBoardImpl implements _QueueBoard {
  const _$QueueBoardImpl({required final List<QueueTicket> tickets})
    : _tickets = tickets;

  final List<QueueTicket> _tickets;
  @override
  List<QueueTicket> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  @override
  String toString() {
    return 'QueueBoard(tickets: $tickets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueueBoardImpl &&
            const DeepCollectionEquality().equals(other._tickets, _tickets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tickets));

  /// Create a copy of QueueBoard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueueBoardImplCopyWith<_$QueueBoardImpl> get copyWith =>
      __$$QueueBoardImplCopyWithImpl<_$QueueBoardImpl>(this, _$identity);
}

abstract class _QueueBoard implements QueueBoard {
  const factory _QueueBoard({required final List<QueueTicket> tickets}) =
      _$QueueBoardImpl;

  @override
  List<QueueTicket> get tickets;

  /// Create a copy of QueueBoard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueueBoardImplCopyWith<_$QueueBoardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
