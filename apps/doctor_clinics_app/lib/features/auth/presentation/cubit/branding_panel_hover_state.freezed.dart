// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branding_panel_hover_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BrandingPanelHoverState {
  bool get hovered => throw _privateConstructorUsedError;

  /// Create a copy of BrandingPanelHoverState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandingPanelHoverStateCopyWith<BrandingPanelHoverState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandingPanelHoverStateCopyWith<$Res> {
  factory $BrandingPanelHoverStateCopyWith(
    BrandingPanelHoverState value,
    $Res Function(BrandingPanelHoverState) then,
  ) = _$BrandingPanelHoverStateCopyWithImpl<$Res, BrandingPanelHoverState>;
  @useResult
  $Res call({bool hovered});
}

/// @nodoc
class _$BrandingPanelHoverStateCopyWithImpl<
  $Res,
  $Val extends BrandingPanelHoverState
>
    implements $BrandingPanelHoverStateCopyWith<$Res> {
  _$BrandingPanelHoverStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandingPanelHoverState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hovered = null}) {
    return _then(
      _value.copyWith(
            hovered: null == hovered
                ? _value.hovered
                : hovered // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BrandingPanelHoverStateImplCopyWith<$Res>
    implements $BrandingPanelHoverStateCopyWith<$Res> {
  factory _$$BrandingPanelHoverStateImplCopyWith(
    _$BrandingPanelHoverStateImpl value,
    $Res Function(_$BrandingPanelHoverStateImpl) then,
  ) = __$$BrandingPanelHoverStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hovered});
}

/// @nodoc
class __$$BrandingPanelHoverStateImplCopyWithImpl<$Res>
    extends
        _$BrandingPanelHoverStateCopyWithImpl<
          $Res,
          _$BrandingPanelHoverStateImpl
        >
    implements _$$BrandingPanelHoverStateImplCopyWith<$Res> {
  __$$BrandingPanelHoverStateImplCopyWithImpl(
    _$BrandingPanelHoverStateImpl _value,
    $Res Function(_$BrandingPanelHoverStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BrandingPanelHoverState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hovered = null}) {
    return _then(
      _$BrandingPanelHoverStateImpl(
        hovered: null == hovered
            ? _value.hovered
            : hovered // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$BrandingPanelHoverStateImpl implements _BrandingPanelHoverState {
  const _$BrandingPanelHoverStateImpl({this.hovered = false});

  @override
  @JsonKey()
  final bool hovered;

  @override
  String toString() {
    return 'BrandingPanelHoverState(hovered: $hovered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandingPanelHoverStateImpl &&
            (identical(other.hovered, hovered) || other.hovered == hovered));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hovered);

  /// Create a copy of BrandingPanelHoverState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandingPanelHoverStateImplCopyWith<_$BrandingPanelHoverStateImpl>
  get copyWith =>
      __$$BrandingPanelHoverStateImplCopyWithImpl<
        _$BrandingPanelHoverStateImpl
      >(this, _$identity);
}

abstract class _BrandingPanelHoverState implements BrandingPanelHoverState {
  const factory _BrandingPanelHoverState({final bool hovered}) =
      _$BrandingPanelHoverStateImpl;

  @override
  bool get hovered;

  /// Create a copy of BrandingPanelHoverState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandingPanelHoverStateImplCopyWith<_$BrandingPanelHoverStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
