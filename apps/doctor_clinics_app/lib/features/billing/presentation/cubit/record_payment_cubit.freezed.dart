// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record_payment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RecordPaymentState {
  bool get loading => throw _privateConstructorUsedError;
  bool get saving => throw _privateConstructorUsedError;
  BillingInvoiceDetail? get detail => throw _privateConstructorUsedError;
  Payment? get saved => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of RecordPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordPaymentStateCopyWith<RecordPaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordPaymentStateCopyWith<$Res> {
  factory $RecordPaymentStateCopyWith(
    RecordPaymentState value,
    $Res Function(RecordPaymentState) then,
  ) = _$RecordPaymentStateCopyWithImpl<$Res, RecordPaymentState>;
  @useResult
  $Res call({
    bool loading,
    bool saving,
    BillingInvoiceDetail? detail,
    Payment? saved,
    String? error,
  });

  $PaymentCopyWith<$Res>? get saved;
}

/// @nodoc
class _$RecordPaymentStateCopyWithImpl<$Res, $Val extends RecordPaymentState>
    implements $RecordPaymentStateCopyWith<$Res> {
  _$RecordPaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? saving = null,
    Object? detail = freezed,
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
            detail: freezed == detail
                ? _value.detail
                : detail // ignore: cast_nullable_to_non_nullable
                      as BillingInvoiceDetail?,
            saved: freezed == saved
                ? _value.saved
                : saved // ignore: cast_nullable_to_non_nullable
                      as Payment?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of RecordPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentCopyWith<$Res>? get saved {
    if (_value.saved == null) {
      return null;
    }

    return $PaymentCopyWith<$Res>(_value.saved!, (value) {
      return _then(_value.copyWith(saved: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecordPaymentStateImplCopyWith<$Res>
    implements $RecordPaymentStateCopyWith<$Res> {
  factory _$$RecordPaymentStateImplCopyWith(
    _$RecordPaymentStateImpl value,
    $Res Function(_$RecordPaymentStateImpl) then,
  ) = __$$RecordPaymentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool loading,
    bool saving,
    BillingInvoiceDetail? detail,
    Payment? saved,
    String? error,
  });

  @override
  $PaymentCopyWith<$Res>? get saved;
}

/// @nodoc
class __$$RecordPaymentStateImplCopyWithImpl<$Res>
    extends _$RecordPaymentStateCopyWithImpl<$Res, _$RecordPaymentStateImpl>
    implements _$$RecordPaymentStateImplCopyWith<$Res> {
  __$$RecordPaymentStateImplCopyWithImpl(
    _$RecordPaymentStateImpl _value,
    $Res Function(_$RecordPaymentStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecordPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? saving = null,
    Object? detail = freezed,
    Object? saved = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _$RecordPaymentStateImpl(
        loading: null == loading
            ? _value.loading
            : loading // ignore: cast_nullable_to_non_nullable
                  as bool,
        saving: null == saving
            ? _value.saving
            : saving // ignore: cast_nullable_to_non_nullable
                  as bool,
        detail: freezed == detail
            ? _value.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as BillingInvoiceDetail?,
        saved: freezed == saved
            ? _value.saved
            : saved // ignore: cast_nullable_to_non_nullable
                  as Payment?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$RecordPaymentStateImpl implements _RecordPaymentState {
  const _$RecordPaymentStateImpl({
    this.loading = true,
    this.saving = false,
    this.detail,
    this.saved,
    this.error,
  });

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool saving;
  @override
  final BillingInvoiceDetail? detail;
  @override
  final Payment? saved;
  @override
  final String? error;

  @override
  String toString() {
    return 'RecordPaymentState(loading: $loading, saving: $saving, detail: $detail, saved: $saved, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordPaymentStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.saving, saving) || other.saving == saving) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, loading, saving, detail, saved, error);

  /// Create a copy of RecordPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordPaymentStateImplCopyWith<_$RecordPaymentStateImpl> get copyWith =>
      __$$RecordPaymentStateImplCopyWithImpl<_$RecordPaymentStateImpl>(
        this,
        _$identity,
      );
}

abstract class _RecordPaymentState implements RecordPaymentState {
  const factory _RecordPaymentState({
    final bool loading,
    final bool saving,
    final BillingInvoiceDetail? detail,
    final Payment? saved,
    final String? error,
  }) = _$RecordPaymentStateImpl;

  @override
  bool get loading;
  @override
  bool get saving;
  @override
  BillingInvoiceDetail? get detail;
  @override
  Payment? get saved;
  @override
  String? get error;

  /// Create a copy of RecordPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordPaymentStateImplCopyWith<_$RecordPaymentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
