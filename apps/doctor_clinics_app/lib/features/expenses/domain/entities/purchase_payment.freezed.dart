// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PurchasePayment _$PurchasePaymentFromJson(Map<String, dynamic> json) {
  return _PurchasePayment.fromJson(json);
}

/// @nodoc
mixin _$PurchasePayment {
  int get id => throw _privateConstructorUsedError;
  int get purchaseId => throw _privateConstructorUsedError;
  int? get vendorId => throw _privateConstructorUsedError;
  String get receiptNumber => throw _privateConstructorUsedError;
  int get amountPiasters => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  DateTime get paymentDate => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  int get createdBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this PurchasePayment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchasePayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchasePaymentCopyWith<PurchasePayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasePaymentCopyWith<$Res> {
  factory $PurchasePaymentCopyWith(
    PurchasePayment value,
    $Res Function(PurchasePayment) then,
  ) = _$PurchasePaymentCopyWithImpl<$Res, PurchasePayment>;
  @useResult
  $Res call({
    int id,
    int purchaseId,
    int? vendorId,
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
class _$PurchasePaymentCopyWithImpl<$Res, $Val extends PurchasePayment>
    implements $PurchasePaymentCopyWith<$Res> {
  _$PurchasePaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchasePayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? purchaseId = null,
    Object? vendorId = freezed,
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
            purchaseId: null == purchaseId
                ? _value.purchaseId
                : purchaseId // ignore: cast_nullable_to_non_nullable
                      as int,
            vendorId: freezed == vendorId
                ? _value.vendorId
                : vendorId // ignore: cast_nullable_to_non_nullable
                      as int?,
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
abstract class _$$PurchasePaymentImplCopyWith<$Res>
    implements $PurchasePaymentCopyWith<$Res> {
  factory _$$PurchasePaymentImplCopyWith(
    _$PurchasePaymentImpl value,
    $Res Function(_$PurchasePaymentImpl) then,
  ) = __$$PurchasePaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int purchaseId,
    int? vendorId,
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
class __$$PurchasePaymentImplCopyWithImpl<$Res>
    extends _$PurchasePaymentCopyWithImpl<$Res, _$PurchasePaymentImpl>
    implements _$$PurchasePaymentImplCopyWith<$Res> {
  __$$PurchasePaymentImplCopyWithImpl(
    _$PurchasePaymentImpl _value,
    $Res Function(_$PurchasePaymentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PurchasePayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? purchaseId = null,
    Object? vendorId = freezed,
    Object? receiptNumber = null,
    Object? amountPiasters = null,
    Object? paymentMethod = null,
    Object? paymentDate = null,
    Object? notes = freezed,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$PurchasePaymentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        purchaseId: null == purchaseId
            ? _value.purchaseId
            : purchaseId // ignore: cast_nullable_to_non_nullable
                  as int,
        vendorId: freezed == vendorId
            ? _value.vendorId
            : vendorId // ignore: cast_nullable_to_non_nullable
                  as int?,
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
class _$PurchasePaymentImpl implements _PurchasePayment {
  const _$PurchasePaymentImpl({
    required this.id,
    required this.purchaseId,
    this.vendorId,
    required this.receiptNumber,
    required this.amountPiasters,
    required this.paymentMethod,
    required this.paymentDate,
    this.notes,
    required this.createdBy,
    required this.createdAt,
  });

  factory _$PurchasePaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchasePaymentImplFromJson(json);

  @override
  final int id;
  @override
  final int purchaseId;
  @override
  final int? vendorId;
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
    return 'PurchasePayment(id: $id, purchaseId: $purchaseId, vendorId: $vendorId, receiptNumber: $receiptNumber, amountPiasters: $amountPiasters, paymentMethod: $paymentMethod, paymentDate: $paymentDate, notes: $notes, createdBy: $createdBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchasePaymentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.purchaseId, purchaseId) ||
                other.purchaseId == purchaseId) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
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
    purchaseId,
    vendorId,
    receiptNumber,
    amountPiasters,
    paymentMethod,
    paymentDate,
    notes,
    createdBy,
    createdAt,
  );

  /// Create a copy of PurchasePayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchasePaymentImplCopyWith<_$PurchasePaymentImpl> get copyWith =>
      __$$PurchasePaymentImplCopyWithImpl<_$PurchasePaymentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchasePaymentImplToJson(this);
  }
}

abstract class _PurchasePayment implements PurchasePayment {
  const factory _PurchasePayment({
    required final int id,
    required final int purchaseId,
    final int? vendorId,
    required final String receiptNumber,
    required final int amountPiasters,
    required final String paymentMethod,
    required final DateTime paymentDate,
    final String? notes,
    required final int createdBy,
    required final DateTime createdAt,
  }) = _$PurchasePaymentImpl;

  factory _PurchasePayment.fromJson(Map<String, dynamic> json) =
      _$PurchasePaymentImpl.fromJson;

  @override
  int get id;
  @override
  int get purchaseId;
  @override
  int? get vendorId;
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

  /// Create a copy of PurchasePayment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchasePaymentImplCopyWith<_$PurchasePaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
