// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_expense_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NewExpenseState {
  bool get loading => throw _privateConstructorUsedError;
  bool get saving => throw _privateConstructorUsedError;
  List<ExpenseCategoryEntity> get categories =>
      throw _privateConstructorUsedError;
  Expense? get saved => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of NewExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewExpenseStateCopyWith<NewExpenseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewExpenseStateCopyWith<$Res> {
  factory $NewExpenseStateCopyWith(
    NewExpenseState value,
    $Res Function(NewExpenseState) then,
  ) = _$NewExpenseStateCopyWithImpl<$Res, NewExpenseState>;
  @useResult
  $Res call({
    bool loading,
    bool saving,
    List<ExpenseCategoryEntity> categories,
    Expense? saved,
    String? error,
  });

  $ExpenseCopyWith<$Res>? get saved;
}

/// @nodoc
class _$NewExpenseStateCopyWithImpl<$Res, $Val extends NewExpenseState>
    implements $NewExpenseStateCopyWith<$Res> {
  _$NewExpenseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? saving = null,
    Object? categories = null,
    Object? saved = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading: null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                      as bool,
            saving: null == saving
                ? _value.saving
                : saving // ignore: cast_nullable_to_non_nullable
                      as bool,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<ExpenseCategoryEntity>,
            saved: freezed == saved
                ? _value.saved
                : saved // ignore: cast_nullable_to_non_nullable
                      as Expense?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of NewExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpenseCopyWith<$Res>? get saved {
    if (_value.saved == null) {
      return null;
    }

    return $ExpenseCopyWith<$Res>(_value.saved!, (value) {
      return _then(_value.copyWith(saved: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewExpenseStateImplCopyWith<$Res>
    implements $NewExpenseStateCopyWith<$Res> {
  factory _$$NewExpenseStateImplCopyWith(
    _$NewExpenseStateImpl value,
    $Res Function(_$NewExpenseStateImpl) then,
  ) = __$$NewExpenseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool loading,
    bool saving,
    List<ExpenseCategoryEntity> categories,
    Expense? saved,
    String? error,
  });

  @override
  $ExpenseCopyWith<$Res>? get saved;
}

/// @nodoc
class __$$NewExpenseStateImplCopyWithImpl<$Res>
    extends _$NewExpenseStateCopyWithImpl<$Res, _$NewExpenseStateImpl>
    implements _$$NewExpenseStateImplCopyWith<$Res> {
  __$$NewExpenseStateImplCopyWithImpl(
    _$NewExpenseStateImpl _value,
    $Res Function(_$NewExpenseStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NewExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? saving = null,
    Object? categories = null,
    Object? saved = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _$NewExpenseStateImpl(
        loading: null == loading
            ? _value.loading
            : loading // ignore: cast_nullable_to_non_nullable
                  as bool,
        saving: null == saving
            ? _value.saving
            : saving // ignore: cast_nullable_to_non_nullable
                  as bool,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<ExpenseCategoryEntity>,
        saved: freezed == saved
            ? _value.saved
            : saved // ignore: cast_nullable_to_non_nullable
                  as Expense?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$NewExpenseStateImpl implements _NewExpenseState {
  const _$NewExpenseStateImpl({
    this.loading = true,
    this.saving = false,
    final List<ExpenseCategoryEntity> categories =
        const <ExpenseCategoryEntity>[],
    this.saved,
    this.error,
  }) : _categories = categories;

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool saving;
  final List<ExpenseCategoryEntity> _categories;
  @override
  @JsonKey()
  List<ExpenseCategoryEntity> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final Expense? saved;
  @override
  final String? error;

  @override
  String toString() {
    return 'NewExpenseState(loading: $loading, saving: $saving, categories: $categories, saved: $saved, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewExpenseStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.saving, saving) || other.saving == saving) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    saving,
    const DeepCollectionEquality().hash(_categories),
    saved,
    error,
  );

  /// Create a copy of NewExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewExpenseStateImplCopyWith<_$NewExpenseStateImpl> get copyWith =>
      __$$NewExpenseStateImplCopyWithImpl<_$NewExpenseStateImpl>(
        this,
        _$identity,
      );
}

abstract class _NewExpenseState implements NewExpenseState {
  const factory _NewExpenseState({
    final bool loading,
    final bool saving,
    final List<ExpenseCategoryEntity> categories,
    final Expense? saved,
    final String? error,
  }) = _$NewExpenseStateImpl;

  @override
  bool get loading;
  @override
  bool get saving;
  @override
  List<ExpenseCategoryEntity> get categories;
  @override
  Expense? get saved;
  @override
  String? get error;

  /// Create a copy of NewExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewExpenseStateImplCopyWith<_$NewExpenseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
