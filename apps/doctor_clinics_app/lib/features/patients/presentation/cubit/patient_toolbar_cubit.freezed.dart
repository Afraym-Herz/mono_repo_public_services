// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_toolbar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PatientToolbarState {
  String get query => throw _privateConstructorUsedError;
  PatientFilter get filter => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;

  /// Create a copy of PatientToolbarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientToolbarStateCopyWith<PatientToolbarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientToolbarStateCopyWith<$Res> {
  factory $PatientToolbarStateCopyWith(
    PatientToolbarState value,
    $Res Function(PatientToolbarState) then,
  ) = _$PatientToolbarStateCopyWithImpl<$Res, PatientToolbarState>;
  @useResult
  $Res call({String query, PatientFilter filter, bool isSearching});
}

/// @nodoc
class _$PatientToolbarStateCopyWithImpl<$Res, $Val extends PatientToolbarState>
    implements $PatientToolbarStateCopyWith<$Res> {
  _$PatientToolbarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientToolbarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? filter = null,
    Object? isSearching = null,
  }) {
    return _then(
      _value.copyWith(
            query: null == query
                ? _value.query
                : query // ignore: cast_nullable_to_non_nullable
                      as String,
            filter: null == filter
                ? _value.filter
                : filter // ignore: cast_nullable_to_non_nullable
                      as PatientFilter,
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
abstract class _$$PatientToolbarStateImplCopyWith<$Res>
    implements $PatientToolbarStateCopyWith<$Res> {
  factory _$$PatientToolbarStateImplCopyWith(
    _$PatientToolbarStateImpl value,
    $Res Function(_$PatientToolbarStateImpl) then,
  ) = __$$PatientToolbarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String query, PatientFilter filter, bool isSearching});
}

/// @nodoc
class __$$PatientToolbarStateImplCopyWithImpl<$Res>
    extends _$PatientToolbarStateCopyWithImpl<$Res, _$PatientToolbarStateImpl>
    implements _$$PatientToolbarStateImplCopyWith<$Res> {
  __$$PatientToolbarStateImplCopyWithImpl(
    _$PatientToolbarStateImpl _value,
    $Res Function(_$PatientToolbarStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientToolbarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? filter = null,
    Object? isSearching = null,
  }) {
    return _then(
      _$PatientToolbarStateImpl(
        query: null == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
        filter: null == filter
            ? _value.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as PatientFilter,
        isSearching: null == isSearching
            ? _value.isSearching
            : isSearching // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$PatientToolbarStateImpl implements _PatientToolbarState {
  const _$PatientToolbarStateImpl({
    this.query = '',
    this.filter = PatientFilter.all,
    this.isSearching = false,
  });

  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final PatientFilter filter;
  @override
  @JsonKey()
  final bool isSearching;

  @override
  String toString() {
    return 'PatientToolbarState(query: $query, filter: $filter, isSearching: $isSearching)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientToolbarStateImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, filter, isSearching);

  /// Create a copy of PatientToolbarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientToolbarStateImplCopyWith<_$PatientToolbarStateImpl> get copyWith =>
      __$$PatientToolbarStateImplCopyWithImpl<_$PatientToolbarStateImpl>(
        this,
        _$identity,
      );
}

abstract class _PatientToolbarState implements PatientToolbarState {
  const factory _PatientToolbarState({
    final String query,
    final PatientFilter filter,
    final bool isSearching,
  }) = _$PatientToolbarStateImpl;

  @override
  String get query;
  @override
  PatientFilter get filter;
  @override
  bool get isSearching;

  /// Create a copy of PatientToolbarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientToolbarStateImplCopyWith<_$PatientToolbarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
