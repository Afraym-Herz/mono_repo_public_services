// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billing_toolbar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BillingToolbarState {
  BillingRange get range => throw _privateConstructorUsedError;
  BillingTab get tab => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;

  /// Create a copy of BillingToolbarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BillingToolbarStateCopyWith<BillingToolbarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillingToolbarStateCopyWith<$Res> {
  factory $BillingToolbarStateCopyWith(
    BillingToolbarState value,
    $Res Function(BillingToolbarState) then,
  ) = _$BillingToolbarStateCopyWithImpl<$Res, BillingToolbarState>;
  @useResult
  $Res call({
    BillingRange range,
    BillingTab tab,
    String query,
    bool isSearching,
  });
}

/// @nodoc
class _$BillingToolbarStateCopyWithImpl<$Res, $Val extends BillingToolbarState>
    implements $BillingToolbarStateCopyWith<$Res> {
  _$BillingToolbarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BillingToolbarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? range = null,
    Object? tab = null,
    Object? query = null,
    Object? isSearching = null,
  }) {
    return _then(
      _value.copyWith(
            range: null == range
                ? _value.range
                : range // ignore: cast_nullable_to_non_nullable
                      as BillingRange,
            tab: null == tab
                ? _value.tab
                : tab // ignore: cast_nullable_to_non_nullable
                      as BillingTab,
            query: null == query
                ? _value.query
                : query // ignore: cast_nullable_to_non_nullable
                      as String,
            isSearching: null == isSearching
                ? _value.isSearching
                : isSearching // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BillingToolbarStateImplCopyWith<$Res>
    implements $BillingToolbarStateCopyWith<$Res> {
  factory _$$BillingToolbarStateImplCopyWith(
    _$BillingToolbarStateImpl value,
    $Res Function(_$BillingToolbarStateImpl) then,
  ) = __$$BillingToolbarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BillingRange range,
    BillingTab tab,
    String query,
    bool isSearching,
  });
}

/// @nodoc
class __$$BillingToolbarStateImplCopyWithImpl<$Res>
    extends _$BillingToolbarStateCopyWithImpl<$Res, _$BillingToolbarStateImpl>
    implements _$$BillingToolbarStateImplCopyWith<$Res> {
  __$$BillingToolbarStateImplCopyWithImpl(
    _$BillingToolbarStateImpl _value,
    $Res Function(_$BillingToolbarStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BillingToolbarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? range = null,
    Object? tab = null,
    Object? query = null,
    Object? isSearching = null,
  }) {
    return _then(
      _$BillingToolbarStateImpl(
        range: null == range
            ? _value.range
            : range // ignore: cast_nullable_to_non_nullable
                  as BillingRange,
        tab: null == tab
            ? _value.tab
            : tab // ignore: cast_nullable_to_non_nullable
                  as BillingTab,
        query: null == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
        isSearching: null == isSearching
            ? _value.isSearching
            : isSearching // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$BillingToolbarStateImpl implements _BillingToolbarState {
  const _$BillingToolbarStateImpl({
    this.range = BillingRange.month,
    this.tab = BillingTab.summary,
    this.query = '',
    this.isSearching = false,
  });

  @override
  @JsonKey()
  final BillingRange range;
  @override
  @JsonKey()
  final BillingTab tab;
  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final bool isSearching;

  @override
  String toString() {
    return 'BillingToolbarState(range: $range, tab: $tab, query: $query, isSearching: $isSearching)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillingToolbarStateImpl &&
            (identical(other.range, range) || other.range == range) &&
            (identical(other.tab, tab) || other.tab == tab) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching));
  }

  @override
  int get hashCode => Object.hash(runtimeType, range, tab, query, isSearching);

  /// Create a copy of BillingToolbarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillingToolbarStateImplCopyWith<_$BillingToolbarStateImpl> get copyWith =>
      __$$BillingToolbarStateImplCopyWithImpl<_$BillingToolbarStateImpl>(
        this,
        _$identity,
      );
}

abstract class _BillingToolbarState implements BillingToolbarState {
  const factory _BillingToolbarState({
    final BillingRange range,
    final BillingTab tab,
    final String query,
    final bool isSearching,
  }) = _$BillingToolbarStateImpl;

  @override
  BillingRange get range;
  @override
  BillingTab get tab;
  @override
  String get query;
  @override
  bool get isSearching;

  /// Create a copy of BillingToolbarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillingToolbarStateImplCopyWith<_$BillingToolbarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
