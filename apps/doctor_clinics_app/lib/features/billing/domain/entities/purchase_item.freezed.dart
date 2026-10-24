// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PurchaseItem _$PurchaseItemFromJson(Map<String, dynamic> json) {
  return _PurchaseItem.fromJson(json);
}

/// @nodoc
mixin _$PurchaseItem {
  int get id => throw _privateConstructorUsedError;
  int get purchaseId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get unitCostPiasters => throw _privateConstructorUsedError;
  int get totalPiasters => throw _privateConstructorUsedError;

  /// Serializes this PurchaseItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseItemCopyWith<PurchaseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseItemCopyWith<$Res> {
  factory $PurchaseItemCopyWith(
    PurchaseItem value,
    $Res Function(PurchaseItem) then,
  ) = _$PurchaseItemCopyWithImpl<$Res, PurchaseItem>;
  @useResult
  $Res call({
    int id,
    int purchaseId,
    String description,
    int quantity,
    int unitCostPiasters,
    int totalPiasters,
  });
}

/// @nodoc
class _$PurchaseItemCopyWithImpl<$Res, $Val extends PurchaseItem>
    implements $PurchaseItemCopyWith<$Res> {
  _$PurchaseItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? purchaseId = null,
    Object? description = null,
    Object? quantity = null,
    Object? unitCostPiasters = null,
    Object? totalPiasters = null,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            unitCostPiasters: null == unitCostPiasters
                ? _value.unitCostPiasters
                : unitCostPiasters // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPiasters: null == totalPiasters
                ? _value.totalPiasters
                : totalPiasters // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PurchaseItemImplCopyWith<$Res>
    implements $PurchaseItemCopyWith<$Res> {
  factory _$$PurchaseItemImplCopyWith(
    _$PurchaseItemImpl value,
    $Res Function(_$PurchaseItemImpl) then,
  ) = __$$PurchaseItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int purchaseId,
    String description,
    int quantity,
    int unitCostPiasters,
    int totalPiasters,
  });
}

/// @nodoc
class __$$PurchaseItemImplCopyWithImpl<$Res>
    extends _$PurchaseItemCopyWithImpl<$Res, _$PurchaseItemImpl>
    implements _$$PurchaseItemImplCopyWith<$Res> {
  __$$PurchaseItemImplCopyWithImpl(
    _$PurchaseItemImpl _value,
    $Res Function(_$PurchaseItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PurchaseItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? purchaseId = null,
    Object? description = null,
    Object? quantity = null,
    Object? unitCostPiasters = null,
    Object? totalPiasters = null,
  }) {
    return _then(
      _$PurchaseItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        purchaseId: null == purchaseId
            ? _value.purchaseId
            : purchaseId // ignore: cast_nullable_to_non_nullable
                  as int,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        unitCostPiasters: null == unitCostPiasters
            ? _value.unitCostPiasters
            : unitCostPiasters // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPiasters: null == totalPiasters
            ? _value.totalPiasters
            : totalPiasters // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseItemImpl implements _PurchaseItem {
  const _$PurchaseItemImpl({
    required this.id,
    required this.purchaseId,
    required this.description,
    required this.quantity,
    required this.unitCostPiasters,
    required this.totalPiasters,
  });

  factory _$PurchaseItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseItemImplFromJson(json);

  @override
  final int id;
  @override
  final int purchaseId;
  @override
  final String description;
  @override
  final int quantity;
  @override
  final int unitCostPiasters;
  @override
  final int totalPiasters;

  @override
  String toString() {
    return 'PurchaseItem(id: $id, purchaseId: $purchaseId, description: $description, quantity: $quantity, unitCostPiasters: $unitCostPiasters, totalPiasters: $totalPiasters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.purchaseId, purchaseId) ||
                other.purchaseId == purchaseId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitCostPiasters, unitCostPiasters) ||
                other.unitCostPiasters == unitCostPiasters) &&
            (identical(other.totalPiasters, totalPiasters) ||
                other.totalPiasters == totalPiasters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    purchaseId,
    description,
    quantity,
    unitCostPiasters,
    totalPiasters,
  );

  /// Create a copy of PurchaseItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseItemImplCopyWith<_$PurchaseItemImpl> get copyWith =>
      __$$PurchaseItemImplCopyWithImpl<_$PurchaseItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseItemImplToJson(this);
  }
}

abstract class _PurchaseItem implements PurchaseItem {
  const factory _PurchaseItem({
    required final int id,
    required final int purchaseId,
    required final String description,
    required final int quantity,
    required final int unitCostPiasters,
    required final int totalPiasters,
  }) = _$PurchaseItemImpl;

  factory _PurchaseItem.fromJson(Map<String, dynamic> json) =
      _$PurchaseItemImpl.fromJson;

  @override
  int get id;
  @override
  int get purchaseId;
  @override
  String get description;
  @override
  int get quantity;
  @override
  int get unitCostPiasters;
  @override
  int get totalPiasters;

  /// Create a copy of PurchaseItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseItemImplCopyWith<_$PurchaseItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
