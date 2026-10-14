// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clinic_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ClinicSettings _$ClinicSettingsFromJson(Map<String, dynamic> json) {
  return _ClinicSettings.fromJson(json);
}

/// @nodoc
mixin _$ClinicSettings {
  String get clinicName => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get paperSize => throw _privateConstructorUsedError;
  int get receiptMargin => throw _privateConstructorUsedError;

  /// Serializes this ClinicSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicSettingsCopyWith<ClinicSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicSettingsCopyWith<$Res> {
  factory $ClinicSettingsCopyWith(
    ClinicSettings value,
    $Res Function(ClinicSettings) then,
  ) = _$ClinicSettingsCopyWithImpl<$Res, ClinicSettings>;
  @useResult
  $Res call({
    String clinicName,
    String language,
    String paperSize,
    int receiptMargin,
  });
}

/// @nodoc
class _$ClinicSettingsCopyWithImpl<$Res, $Val extends ClinicSettings>
    implements $ClinicSettingsCopyWith<$Res> {
  _$ClinicSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicName = null,
    Object? language = null,
    Object? paperSize = null,
    Object? receiptMargin = null,
  }) {
    return _then(
      _value.copyWith(
            clinicName: null == clinicName
                ? _value.clinicName
                : clinicName // ignore: cast_nullable_to_non_nullable
                      as String,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
            paperSize: null == paperSize
                ? _value.paperSize
                : paperSize // ignore: cast_nullable_to_non_nullable
                      as String,
            receiptMargin: null == receiptMargin
                ? _value.receiptMargin
                : receiptMargin // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClinicSettingsImplCopyWith<$Res>
    implements $ClinicSettingsCopyWith<$Res> {
  factory _$$ClinicSettingsImplCopyWith(
    _$ClinicSettingsImpl value,
    $Res Function(_$ClinicSettingsImpl) then,
  ) = __$$ClinicSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String clinicName,
    String language,
    String paperSize,
    int receiptMargin,
  });
}

/// @nodoc
class __$$ClinicSettingsImplCopyWithImpl<$Res>
    extends _$ClinicSettingsCopyWithImpl<$Res, _$ClinicSettingsImpl>
    implements _$$ClinicSettingsImplCopyWith<$Res> {
  __$$ClinicSettingsImplCopyWithImpl(
    _$ClinicSettingsImpl _value,
    $Res Function(_$ClinicSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicName = null,
    Object? language = null,
    Object? paperSize = null,
    Object? receiptMargin = null,
  }) {
    return _then(
      _$ClinicSettingsImpl(
        clinicName: null == clinicName
            ? _value.clinicName
            : clinicName // ignore: cast_nullable_to_non_nullable
                  as String,
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        paperSize: null == paperSize
            ? _value.paperSize
            : paperSize // ignore: cast_nullable_to_non_nullable
                  as String,
        receiptMargin: null == receiptMargin
            ? _value.receiptMargin
            : receiptMargin // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicSettingsImpl implements _ClinicSettings {
  const _$ClinicSettingsImpl({
    required this.clinicName,
    required this.language,
    required this.paperSize,
    required this.receiptMargin,
  });

  factory _$ClinicSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicSettingsImplFromJson(json);

  @override
  final String clinicName;
  @override
  final String language;
  @override
  final String paperSize;
  @override
  final int receiptMargin;

  @override
  String toString() {
    return 'ClinicSettings(clinicName: $clinicName, language: $language, paperSize: $paperSize, receiptMargin: $receiptMargin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicSettingsImpl &&
            (identical(other.clinicName, clinicName) ||
                other.clinicName == clinicName) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.paperSize, paperSize) ||
                other.paperSize == paperSize) &&
            (identical(other.receiptMargin, receiptMargin) ||
                other.receiptMargin == receiptMargin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clinicName, language, paperSize, receiptMargin);

  /// Create a copy of ClinicSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicSettingsImplCopyWith<_$ClinicSettingsImpl> get copyWith =>
      __$$ClinicSettingsImplCopyWithImpl<_$ClinicSettingsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicSettingsImplToJson(this);
  }
}

abstract class _ClinicSettings implements ClinicSettings {
  const factory _ClinicSettings({
    required final String clinicName,
    required final String language,
    required final String paperSize,
    required final int receiptMargin,
  }) = _$ClinicSettingsImpl;

  factory _ClinicSettings.fromJson(Map<String, dynamic> json) =
      _$ClinicSettingsImpl.fromJson;

  @override
  String get clinicName;
  @override
  String get language;
  @override
  String get paperSize;
  @override
  int get receiptMargin;

  /// Create a copy of ClinicSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicSettingsImplCopyWith<_$ClinicSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
