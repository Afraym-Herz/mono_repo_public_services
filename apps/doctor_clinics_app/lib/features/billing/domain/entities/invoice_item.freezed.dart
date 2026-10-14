// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InvoiceItem _$InvoiceItemFromJson(Map<String, dynamic> json) {
  return _InvoiceItem.fromJson(json);
}

/// @nodoc
mixin _$InvoiceItem {
  int get id => throw _privateConstructorUsedError;
  int get invoiceId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get unitPricePiasters => throw _privateConstructorUsedError;
  int get totalPiasters => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this InvoiceItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceItemCopyWith<InvoiceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceItemCopyWith<$Res> {
  factory $InvoiceItemCopyWith(
    InvoiceItem value,
    $Res Function(InvoiceItem) then,
  ) = _$InvoiceItemCopyWithImpl<$Res, InvoiceItem>;
  @useResult
  $Res call({
    int id,
    int invoiceId,
    String description,
    int quantity,
    int unitPricePiasters,
    int totalPiasters,
    String? notes,
  });
}

/// @nodoc
class _$InvoiceItemCopyWithImpl<$Res, $Val extends InvoiceItem>
    implements $InvoiceItemCopyWith<$Res> {
  _$InvoiceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoiceId = null,
    Object? description = null,
    Object? quantity = null,
    Object? unitPricePiasters = null,
    Object? totalPiasters = null,
    Object? notes = freezed,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            unitPricePiasters: null == unitPricePiasters
                ? _value.unitPricePiasters
                : unitPricePiasters // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPiasters: null == totalPiasters
                ? _value.totalPiasters
                : totalPiasters // ignore: cast_nullable_to_non_nullable
                      as int,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InvoiceItemImplCopyWith<$Res>
    implements $InvoiceItemCopyWith<$Res> {
  factory _$$InvoiceItemImplCopyWith(
    _$InvoiceItemImpl value,
    $Res Function(_$InvoiceItemImpl) then,
  ) = __$$InvoiceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int invoiceId,
    String description,
    int quantity,
    int unitPricePiasters,
    int totalPiasters,
    String? notes,
  });
}

/// @nodoc
class __$$InvoiceItemImplCopyWithImpl<$Res>
    extends _$InvoiceItemCopyWithImpl<$Res, _$InvoiceItemImpl>
    implements _$$InvoiceItemImplCopyWith<$Res> {
  __$$InvoiceItemImplCopyWithImpl(
    _$InvoiceItemImpl _value,
    $Res Function(_$InvoiceItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoiceId = null,
    Object? description = null,
    Object? quantity = null,
    Object? unitPricePiasters = null,
    Object? totalPiasters = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$InvoiceItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        invoiceId: null == invoiceId
            ? _value.invoiceId
            : invoiceId // ignore: cast_nullable_to_non_nullable
                  as int,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        unitPricePiasters: null == unitPricePiasters
            ? _value.unitPricePiasters
            : unitPricePiasters // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPiasters: null == totalPiasters
            ? _value.totalPiasters
            : totalPiasters // ignore: cast_nullable_to_non_nullable
                  as int,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceItemImpl implements _InvoiceItem {
  const _$InvoiceItemImpl({
    required this.id,
    required this.invoiceId,
    required this.description,
    required this.quantity,
    required this.unitPricePiasters,
    required this.totalPiasters,
    this.notes,
  });

  factory _$InvoiceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceItemImplFromJson(json);

  @override
  final int id;
  @override
  final int invoiceId;
  @override
  final String description;
  @override
  final int quantity;
  @override
  final int unitPricePiasters;
  @override
  final int totalPiasters;
  @override
  final String? notes;

  @override
  String toString() {
    return 'InvoiceItem(id: $id, invoiceId: $invoiceId, description: $description, quantity: $quantity, unitPricePiasters: $unitPricePiasters, totalPiasters: $totalPiasters, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPricePiasters, unitPricePiasters) ||
                other.unitPricePiasters == unitPricePiasters) &&
            (identical(other.totalPiasters, totalPiasters) ||
                other.totalPiasters == totalPiasters) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    invoiceId,
    description,
    quantity,
    unitPricePiasters,
    totalPiasters,
    notes,
  );

  /// Create a copy of InvoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceItemImplCopyWith<_$InvoiceItemImpl> get copyWith =>
      __$$InvoiceItemImplCopyWithImpl<_$InvoiceItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceItemImplToJson(this);
  }
}

abstract class _InvoiceItem implements InvoiceItem {
  const factory _InvoiceItem({
    required final int id,
    required final int invoiceId,
    required final String description,
    required final int quantity,
    required final int unitPricePiasters,
    required final int totalPiasters,
    final String? notes,
  }) = _$InvoiceItemImpl;

  factory _InvoiceItem.fromJson(Map<String, dynamic> json) =
      _$InvoiceItemImpl.fromJson;

  @override
  int get id;
  @override
  int get invoiceId;
  @override
  String get description;
  @override
  int get quantity;
  @override
  int get unitPricePiasters;
  @override
  int get totalPiasters;
  @override
  String? get notes;

  /// Create a copy of InvoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceItemImplCopyWith<_$InvoiceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
