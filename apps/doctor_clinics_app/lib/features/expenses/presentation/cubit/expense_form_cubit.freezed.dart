// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ExpenseFormState {
  bool get loading => throw _privateConstructorUsedError;
  bool get saving => throw _privateConstructorUsedError;
  bool get saved => throw _privateConstructorUsedError;
  Expense? get expense => throw _privateConstructorUsedError;
  List<ExpenseCategoryEntity> get categories =>
      throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseFormStateCopyWith<ExpenseFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseFormStateCopyWith<$Res> {
  factory $ExpenseFormStateCopyWith(
    ExpenseFormState value,
    $Res Function(ExpenseFormState) then,
  ) = _$ExpenseFormStateCopyWithImpl<$Res, ExpenseFormState>;
  @useResult
  $Res call({
    bool loading,
    bool saving,
    bool saved,
    Expense? expense,
    List<ExpenseCategoryEntity> categories,
    String? error,
  });

  $ExpenseCopyWith<$Res>? get expense;
}

/// @nodoc
class _$ExpenseFormStateCopyWithImpl<$Res, $Val extends ExpenseFormState>
    implements $ExpenseFormStateCopyWith<$Res> {
  _$ExpenseFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? saving = null,
    Object? saved = null,
    Object? expense = freezed,
    Object? categories = null,
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
            saved: null == saved
                ? _value.saved
                : saved // ignore: cast_nullable_to_non_nullable
                      as bool,
            expense: freezed == expense
                ? _value.expense
                : expense // ignore: cast_nullable_to_non_nullable
                      as Expense?,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<ExpenseCategoryEntity>,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ExpenseFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpenseCopyWith<$Res>? get expense {
    if (_value.expense == null) {
      return null;
    }

    return $ExpenseCopyWith<$Res>(_value.expense!, (value) {
      return _then(_value.copyWith(expense: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExpenseFormStateImplCopyWith<$Res>
    implements $ExpenseFormStateCopyWith<$Res> {
  factory _$$ExpenseFormStateImplCopyWith(
    _$ExpenseFormStateImpl value,
    $Res Function(_$ExpenseFormStateImpl) then,
  ) = __$$ExpenseFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool loading,
    bool saving,
    bool saved,
    Expense? expense,
    List<ExpenseCategoryEntity> categories,
    String? error,
  });

  @override
  $ExpenseCopyWith<$Res>? get expense;
}

/// @nodoc
class __$$ExpenseFormStateImplCopyWithImpl<$Res>
    extends _$ExpenseFormStateCopyWithImpl<$Res, _$ExpenseFormStateImpl>
    implements _$$ExpenseFormStateImplCopyWith<$Res> {
  __$$ExpenseFormStateImplCopyWithImpl(
    _$ExpenseFormStateImpl _value,
    $Res Function(_$ExpenseFormStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpenseFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? saving = null,
    Object? saved = null,
    Object? expense = freezed,
    Object? categories = null,
    Object? error = freezed,
  }) {
    return _then(
      _$ExpenseFormStateImpl(
        loading: null == loading
            ? _value.loading
            : loading // ignore: cast_nullable_to_non_nullable
                  as bool,
        saving: null == saving
            ? _value.saving
            : saving // ignore: cast_nullable_to_non_nullable
                  as bool,
        saved: null == saved
            ? _value.saved
            : saved // ignore: cast_nullable_to_non_nullable
                  as bool,
        expense: freezed == expense
            ? _value.expense
            : expense // ignore: cast_nullable_to_non_nullable
                  as Expense?,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<ExpenseCategoryEntity>,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ExpenseFormStateImpl implements _ExpenseFormState {
  const _$ExpenseFormStateImpl({
    this.loading = true,
    this.saving = false,
    this.saved = false,
    this.expense,
    final List<ExpenseCategoryEntity> categories =
        const <ExpenseCategoryEntity>[],
    this.error,
  }) : _categories = categories;

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool saving;
  @override
  @JsonKey()
  final bool saved;
  @override
  final Expense? expense;
  final List<ExpenseCategoryEntity> _categories;
  @override
  @JsonKey()
  List<ExpenseCategoryEntity> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'ExpenseFormState(loading: $loading, saving: $saving, saved: $saved, expense: $expense, categories: $categories, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseFormStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.saving, saving) || other.saving == saving) &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.expense, expense) || other.expense == expense) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    saving,
    saved,
    expense,
    const DeepCollectionEquality().hash(_categories),
    error,
  );

  /// Create a copy of ExpenseFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseFormStateImplCopyWith<_$ExpenseFormStateImpl> get copyWith =>
      __$$ExpenseFormStateImplCopyWithImpl<_$ExpenseFormStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ExpenseFormState implements ExpenseFormState {
  const factory _ExpenseFormState({
    final bool loading,
    final bool saving,
    final bool saved,
    final Expense? expense,
    final List<ExpenseCategoryEntity> categories,
    final String? error,
  }) = _$ExpenseFormStateImpl;

  @override
  bool get loading;
  @override
  bool get saving;
  @override
  bool get saved;
  @override
  Expense? get expense;
  @override
  List<ExpenseCategoryEntity> get categories;
  @override
  String? get error;

  /// Create a copy of ExpenseFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseFormStateImplCopyWith<_$ExpenseFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
