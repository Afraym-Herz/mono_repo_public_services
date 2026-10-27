// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Purchase _$PurchaseFromJson(Map<String, dynamic> json) {
  return _Purchase.fromJson(json);
}

/// @nodoc
mixin _$Purchase {
  int get id => throw _privateConstructorUsedError;
  int? get vendorId => throw _privateConstructorUsedError;
  String get purchaseNumber => throw _privateConstructorUsedError;
  DateTime get purchaseDate => throw _privateConstructorUsedError;
  int get totalPiasters => throw _privateConstructorUsedError;
  int get paidPiasters => throw _privateConstructorUsedError;
  int get duePiasters => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  int get createdBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Purchase to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Purchase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseCopyWith<Purchase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseCopyWith<$Res> {
  factory $PurchaseCopyWith(Purchase value, $Res Function(Purchase) then) =
      _$PurchaseCopyWithImpl<$Res, Purchase>;
  @useResult
  $Res call({
    int id,
    int? vendorId,
    String purchaseNumber,
    DateTime purchaseDate,
    int totalPiasters,
    int paidPiasters,
    int duePiasters,
    String status,
    String? notes,
    int createdBy,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$PurchaseCopyWithImpl<$Res, $Val extends Purchase>
    implements $PurchaseCopyWith<$Res> {
  _$PurchaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Purchase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vendorId = freezed,
    Object? purchaseNumber = null,
    Object? purchaseDate = null,
    Object? totalPiasters = null,
    Object? paidPiasters = null,
    Object? duePiasters = null,
    Object? status = null,
    Object? notes = freezed,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            vendorId: freezed == vendorId
                ? _value.vendorId
                : vendorId // ignore: cast_nullable_to_non_nullable
                      as int?,
            purchaseNumber: null == purchaseNumber
                ? _value.purchaseNumber
                : purchaseNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            purchaseDate: null == purchaseDate
                ? _value.purchaseDate
                : purchaseDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            totalPiasters: null == totalPiasters
                ? _value.totalPiasters
                : totalPiasters // ignore: cast_nullable_to_non_nullable
                      as int,
            paidPiasters: null == paidPiasters
                ? _value.paidPiasters
                : paidPiasters // ignore: cast_nullable_to_non_nullable
                      as int,
            duePiasters: null == duePiasters
                ? _value.duePiasters
                : duePiasters // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
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
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PurchaseImplCopyWith<$Res>
    implements $PurchaseCopyWith<$Res> {
  factory _$$PurchaseImplCopyWith(
    _$PurchaseImpl value,
    $Res Function(_$PurchaseImpl) then,
  ) = __$$PurchaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int? vendorId,
    String purchaseNumber,
    DateTime purchaseDate,
    int totalPiasters,
    int paidPiasters,
    int duePiasters,
    String status,
    String? notes,
    int createdBy,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$PurchaseImplCopyWithImpl<$Res>
    extends _$PurchaseCopyWithImpl<$Res, _$PurchaseImpl>
    implements _$$PurchaseImplCopyWith<$Res> {
  __$$PurchaseImplCopyWithImpl(
    _$PurchaseImpl _value,
    $Res Function(_$PurchaseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Purchase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vendorId = freezed,
    Object? purchaseNumber = null,
    Object? purchaseDate = null,
    Object? totalPiasters = null,
    Object? paidPiasters = null,
    Object? duePiasters = null,
    Object? status = null,
    Object? notes = freezed,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$PurchaseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        vendorId: freezed == vendorId
            ? _value.vendorId
            : vendorId // ignore: cast_nullable_to_non_nullable
                  as int?,
        purchaseNumber: null == purchaseNumber
            ? _value.purchaseNumber
            : purchaseNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        purchaseDate: null == purchaseDate
            ? _value.purchaseDate
            : purchaseDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        totalPiasters: null == totalPiasters
            ? _value.totalPiasters
            : totalPiasters // ignore: cast_nullable_to_non_nullable
                  as int,
        paidPiasters: null == paidPiasters
            ? _value.paidPiasters
            : paidPiasters // ignore: cast_nullable_to_non_nullable
                  as int,
        duePiasters: null == duePiasters
            ? _value.duePiasters
            : duePiasters // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
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
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseImpl implements _Purchase {
  const _$PurchaseImpl({
    required this.id,
    this.vendorId,
    required this.purchaseNumber,
    required this.purchaseDate,
    required this.totalPiasters,
    required this.paidPiasters,
    required this.duePiasters,
    required this.status,
    this.notes,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$PurchaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseImplFromJson(json);

  @override
  final int id;
  @override
  final int? vendorId;
  @override
  final String purchaseNumber;
  @override
  final DateTime purchaseDate;
  @override
  final int totalPiasters;
  @override
  final int paidPiasters;
  @override
  final int duePiasters;
  @override
  final String status;
  @override
  final String? notes;
  @override
  final int createdBy;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Purchase(id: $id, vendorId: $vendorId, purchaseNumber: $purchaseNumber, purchaseDate: $purchaseDate, totalPiasters: $totalPiasters, paidPiasters: $paidPiasters, duePiasters: $duePiasters, status: $status, notes: $notes, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.purchaseNumber, purchaseNumber) ||
                other.purchaseNumber == purchaseNumber) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.totalPiasters, totalPiasters) ||
                other.totalPiasters == totalPiasters) &&
            (identical(other.paidPiasters, paidPiasters) ||
                other.paidPiasters == paidPiasters) &&
            (identical(other.duePiasters, duePiasters) ||
                other.duePiasters == duePiasters) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    vendorId,
    purchaseNumber,
    purchaseDate,
    totalPiasters,
    paidPiasters,
    duePiasters,
    status,
    notes,
    createdBy,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Purchase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseImplCopyWith<_$PurchaseImpl> get copyWith =>
      __$$PurchaseImplCopyWithImpl<_$PurchaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseImplToJson(this);
  }
}

abstract class _Purchase implements Purchase {
  const factory _Purchase({
    required final int id,
    final int? vendorId,
    required final String purchaseNumber,
    required final DateTime purchaseDate,
    required final int totalPiasters,
    required final int paidPiasters,
    required final int duePiasters,
    required final String status,
    final String? notes,
    required final int createdBy,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$PurchaseImpl;

  factory _Purchase.fromJson(Map<String, dynamic> json) =
      _$PurchaseImpl.fromJson;

  @override
  int get id;
  @override
  int? get vendorId;
  @override
  String get purchaseNumber;
  @override
  DateTime get purchaseDate;
  @override
  int get totalPiasters;
  @override
  int get paidPiasters;
  @override
  int get duePiasters;
  @override
  String get status;
  @override
  String? get notes;
  @override
  int get createdBy;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Purchase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseImplCopyWith<_$PurchaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
