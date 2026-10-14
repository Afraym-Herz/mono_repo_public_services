// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
mixin _$Payment {
  int get id => throw _privateConstructorUsedError;
  int get invoiceId => throw _privateConstructorUsedError;
  String get receiptNumber => throw _privateConstructorUsedError;
  int get amountPiasters => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  DateTime get paymentDate => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  int get createdBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res, Payment>;
  @useResult
  $Res call({
    int id,
    int invoiceId,
    String receiptNumber,
    int amountPiasters,
    String paymentMethod,
    DateTime paymentDate,
    String? notes,
    int createdBy,
    DateTime createdAt,
  });
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res, $Val extends Payment>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoiceId = null,
    Object? receiptNumber = null,
    Object? amountPiasters = null,
    Object? paymentMethod = null,
    Object? paymentDate = null,
    Object? notes = freezed,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            invoiceId: null == invoiceId
                ? _value.invoiceId
                : invoiceId // ignore: cast_nullable_to_non_nullable
                      as int,
            receiptNumber: null == receiptNumber
                ? _value.receiptNumber
                : receiptNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            amountPiasters: null == amountPiasters
                ? _value.amountPiasters
                : amountPiasters // ignore: cast_nullable_to_non_nullable
                      as int,
            paymentMethod: null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentDate: null == paymentDate
                ? _value.paymentDate
                : paymentDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdBy: null == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentImplCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$$PaymentImplCopyWith(
    _$PaymentImpl value,
    $Res Function(_$PaymentImpl) then,
  ) = __$$PaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int invoiceId,
    String receiptNumber,
    int amountPiasters,
    String paymentMethod,
    DateTime paymentDate,
    String? notes,
    int createdBy,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$PaymentImplCopyWithImpl<$Res>
    extends _$PaymentCopyWithImpl<$Res, _$PaymentImpl>
    implements _$$PaymentImplCopyWith<$Res> {
  __$$PaymentImplCopyWithImpl(
    _$PaymentImpl _value,
    $Res Function(_$PaymentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoiceId = null,
    Object? receiptNumber = null,
    Object? amountPiasters = null,
    Object? paymentMethod = null,
    Object? paymentDate = null,
    Object? notes = freezed,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$PaymentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        invoiceId: null == invoiceId
            ? _value.invoiceId
            : invoiceId // ignore: cast_nullable_to_non_nullable
                  as int,
        receiptNumber: null == receiptNumber
            ? _value.receiptNumber
            : receiptNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        amountPiasters: null == amountPiasters
            ? _value.amountPiasters
            : amountPiasters // ignore: cast_nullable_to_non_nullable
                  as int,
        paymentMethod: null == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentDate: null == paymentDate
            ? _value.paymentDate
            : paymentDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdBy: null == createdBy
            ? _value.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentImpl implements _Payment {
  const _$PaymentImpl({
    required this.id,
    required this.invoiceId,
    required this.receiptNumber,
    required this.amountPiasters,
    required this.paymentMethod,
    required this.paymentDate,
    this.notes,
    required this.createdBy,
    required this.createdAt,
  });

  factory _$PaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentImplFromJson(json);

  @override
  final int id;
  @override
  final int invoiceId;
  @override
  final String receiptNumber;
  @override
  final int amountPiasters;
  @override
  final String paymentMethod;
  @override
  final DateTime paymentDate;
  @override
  final String? notes;
  @override
  final int createdBy;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Payment(id: $id, invoiceId: $invoiceId, receiptNumber: $receiptNumber, amountPiasters: $amountPiasters, paymentMethod: $paymentMethod, paymentDate: $paymentDate, notes: $notes, createdBy: $createdBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.receiptNumber, receiptNumber) ||
                other.receiptNumber == receiptNumber) &&
            (identical(other.amountPiasters, amountPiasters) ||
                other.amountPiasters == amountPiasters) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    invoiceId,
    receiptNumber,
    amountPiasters,
    paymentMethod,
    paymentDate,
    notes,
    createdBy,
    createdAt,
  );

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      __$$PaymentImplCopyWithImpl<_$PaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentImplToJson(this);
  }
}

abstract class _Payment implements Payment {
  const factory _Payment({
    required final int id,
    required final int invoiceId,
    required final String receiptNumber,
    required final int amountPiasters,
    required final String paymentMethod,
    required final DateTime paymentDate,
    final String? notes,
    required final int createdBy,
    required final DateTime createdAt,
  }) = _$PaymentImpl;

  factory _Payment.fromJson(Map<String, dynamic> json) = _$PaymentImpl.fromJson;

  @override
  int get id;
  @override
  int get invoiceId;
  @override
  String get receiptNumber;
  @override
  int get amountPiasters;
  @override
  String get paymentMethod;
  @override
  DateTime get paymentDate;
  @override
  String? get notes;
  @override
  int get createdBy;
  @override
  DateTime get createdAt;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
