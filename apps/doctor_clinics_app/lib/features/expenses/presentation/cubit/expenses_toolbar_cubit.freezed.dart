// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses_toolbar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ExpensesToolbarState {
  FinanceRange get range => throw _privateConstructorUsedError;
  ExpensesSection get section => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;

  /// Create a copy of ExpensesToolbarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpensesToolbarStateCopyWith<ExpensesToolbarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpensesToolbarStateCopyWith<$Res> {
  factory $ExpensesToolbarStateCopyWith(
    ExpensesToolbarState value,
    $Res Function(ExpensesToolbarState) then,
  ) = _$ExpensesToolbarStateCopyWithImpl<$Res, ExpensesToolbarState>;
  @useResult
  $Res call({
    FinanceRange range,
    ExpensesSection section,
    String query,
    bool isSearching,
  });
}

/// @nodoc
class _$ExpensesToolbarStateCopyWithImpl<
  $Res,
  $Val extends ExpensesToolbarState
>
    implements $ExpensesToolbarStateCopyWith<$Res> {
  _$ExpensesToolbarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpensesToolbarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? range = null,
    Object? section = null,
    Object? query = null,
    Object? isSearching = null,
  }) {
    return _then(
      _value.copyWith(
            range: null == range
                ? _value.range
                : range // ignore: cast_nullable_to_non_nullable
                      as FinanceRange,
            section: null == section
                ? _value.section
                : section // ignore: cast_nullable_to_non_nullable
                      as ExpensesSection,
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
abstract class _$$ExpensesToolbarStateImplCopyWith<$Res>
    implements $ExpensesToolbarStateCopyWith<$Res> {
  factory _$$ExpensesToolbarStateImplCopyWith(
    _$ExpensesToolbarStateImpl value,
    $Res Function(_$ExpensesToolbarStateImpl) then,
  ) = __$$ExpensesToolbarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    FinanceRange range,
    ExpensesSection section,
    String query,
    bool isSearching,
  });
}

/// @nodoc
class __$$ExpensesToolbarStateImplCopyWithImpl<$Res>
    extends _$ExpensesToolbarStateCopyWithImpl<$Res, _$ExpensesToolbarStateImpl>
    implements _$$ExpensesToolbarStateImplCopyWith<$Res> {
  __$$ExpensesToolbarStateImplCopyWithImpl(
    _$ExpensesToolbarStateImpl _value,
    $Res Function(_$ExpensesToolbarStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpensesToolbarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? range = null,
    Object? section = null,
    Object? query = null,
    Object? isSearching = null,
  }) {
    return _then(
      _$ExpensesToolbarStateImpl(
        range: null == range
            ? _value.range
            : range // ignore: cast_nullable_to_non_nullable
                  as FinanceRange,
        section: null == section
            ? _value.section
            : section // ignore: cast_nullable_to_non_nullable
                  as ExpensesSection,
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

class _$ExpensesToolbarStateImpl implements _ExpensesToolbarState {
  const _$ExpensesToolbarStateImpl({
    this.range = FinanceRange.month,
    this.section = ExpensesSection.expenses,
    this.query = '',
    this.isSearching = false,
  });

  @override
  @JsonKey()
  final FinanceRange range;
  @override
  @JsonKey()
  final ExpensesSection section;
  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final bool isSearching;

  @override
  String toString() {
    return 'ExpensesToolbarState(range: $range, section: $section, query: $query, isSearching: $isSearching)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpensesToolbarStateImpl &&
            (identical(other.range, range) || other.range == range) &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, range, section, query, isSearching);

  /// Create a copy of ExpensesToolbarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpensesToolbarStateImplCopyWith<_$ExpensesToolbarStateImpl>
  get copyWith =>
      __$$ExpensesToolbarStateImplCopyWithImpl<_$ExpensesToolbarStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ExpensesToolbarState implements ExpensesToolbarState {
  const factory _ExpensesToolbarState({
    final FinanceRange range,
    final ExpensesSection section,
    final String query,
    final bool isSearching,
  }) = _$ExpensesToolbarStateImpl;

  @override
  FinanceRange get range;
  @override
  ExpensesSection get section;
  @override
  String get query;
  @override
  bool get isSearching;

  /// Create a copy of ExpensesToolbarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpensesToolbarStateImplCopyWith<_$ExpensesToolbarStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
