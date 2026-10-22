// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_name_matches_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PatientNameMatchesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String query, List<Patient> matches) loading,
    required TResult Function(String query, List<Patient> matches) success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String query, List<Patient> matches)? loading,
    TResult? Function(String query, List<Patient> matches)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String query, List<Patient> matches)? loading,
    TResult Function(String query, List<Patient> matches)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientNameMatchesStateCopyWith<$Res> {
  factory $PatientNameMatchesStateCopyWith(
    PatientNameMatchesState value,
    $Res Function(PatientNameMatchesState) then,
  ) = _$PatientNameMatchesStateCopyWithImpl<$Res, PatientNameMatchesState>;
}

/// @nodoc
class _$PatientNameMatchesStateCopyWithImpl<
  $Res,
  $Val extends PatientNameMatchesState
>
    implements $PatientNameMatchesStateCopyWith<$Res> {
  _$PatientNameMatchesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientNameMatchesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PatientNameMatchesStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientNameMatchesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PatientNameMatchesState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String query, List<Patient> matches) loading,
    required TResult Function(String query, List<Patient> matches) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String query, List<Patient> matches)? loading,
    TResult? Function(String query, List<Patient> matches)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String query, List<Patient> matches)? loading,
    TResult Function(String query, List<Patient> matches)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PatientNameMatchesState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query, List<Patient> matches});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PatientNameMatchesStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientNameMatchesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? query = null, Object? matches = null}) {
    return _then(
      _$LoadingImpl(
        query: null == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
        matches: null == matches
            ? _value._matches
            : matches // ignore: cast_nullable_to_non_nullable
                  as List<Patient>,
      ),
    );
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({
    this.query = '',
    final List<Patient> matches = const <Patient>[],
  }) : _matches = matches;

  @override
  @JsonKey()
  final String query;
  final List<Patient> _matches;
  @override
  @JsonKey()
  List<Patient> get matches {
    if (_matches is EqualUnmodifiableListView) return _matches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matches);
  }

  @override
  String toString() {
    return 'PatientNameMatchesState.loading(query: $query, matches: $matches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(other._matches, _matches));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    query,
    const DeepCollectionEquality().hash(_matches),
  );

  /// Create a copy of PatientNameMatchesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String query, List<Patient> matches) loading,
    required TResult Function(String query, List<Patient> matches) success,
  }) {
    return loading(query, matches);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String query, List<Patient> matches)? loading,
    TResult? Function(String query, List<Patient> matches)? success,
  }) {
    return loading?.call(query, matches);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String query, List<Patient> matches)? loading,
    TResult Function(String query, List<Patient> matches)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(query, matches);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PatientNameMatchesState {
  const factory _Loading({final String query, final List<Patient> matches}) =
      _$LoadingImpl;

  String get query;
  List<Patient> get matches;

  /// Create a copy of PatientNameMatchesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query, List<Patient> matches});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$PatientNameMatchesStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientNameMatchesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? query = null, Object? matches = null}) {
    return _then(
      _$SuccessImpl(
        query: null == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
        matches: null == matches
            ? _value._matches
            : matches // ignore: cast_nullable_to_non_nullable
                  as List<Patient>,
      ),
    );
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({
    required this.query,
    required final List<Patient> matches,
  }) : _matches = matches;

  @override
  final String query;
  final List<Patient> _matches;
  @override
  List<Patient> get matches {
    if (_matches is EqualUnmodifiableListView) return _matches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matches);
  }

  @override
  String toString() {
    return 'PatientNameMatchesState.success(query: $query, matches: $matches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(other._matches, _matches));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    query,
    const DeepCollectionEquality().hash(_matches),
  );

  /// Create a copy of PatientNameMatchesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String query, List<Patient> matches) loading,
    required TResult Function(String query, List<Patient> matches) success,
  }) {
    return success(query, matches);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String query, List<Patient> matches)? loading,
    TResult? Function(String query, List<Patient> matches)? success,
  }) {
    return success?.call(query, matches);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String query, List<Patient> matches)? loading,
    TResult Function(String query, List<Patient> matches)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(query, matches);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements PatientNameMatchesState {
  const factory _Success({
    required final String query,
    required final List<Patient> matches,
  }) = _$SuccessImpl;

  String get query;
  List<Patient> get matches;

  /// Create a copy of PatientNameMatchesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
