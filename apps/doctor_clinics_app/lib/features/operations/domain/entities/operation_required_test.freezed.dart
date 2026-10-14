// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_required_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OperationRequiredTest _$OperationRequiredTestFromJson(
  Map<String, dynamic> json,
) {
  return _OperationRequiredTest.fromJson(json);
}

/// @nodoc
mixin _$OperationRequiredTest {
  int get id => throw _privateConstructorUsedError;
  int get operationId => throw _privateConstructorUsedError;
  String get testName => throw _privateConstructorUsedError;
  bool? get isDone => throw _privateConstructorUsedError;
  String? get result => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this OperationRequiredTest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OperationRequiredTest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OperationRequiredTestCopyWith<OperationRequiredTest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationRequiredTestCopyWith<$Res> {
  factory $OperationRequiredTestCopyWith(
    OperationRequiredTest value,
    $Res Function(OperationRequiredTest) then,
  ) = _$OperationRequiredTestCopyWithImpl<$Res, OperationRequiredTest>;
  @useResult
  $Res call({
    int id,
    int operationId,
    String testName,
    bool? isDone,
    String? result,
    String? notes,
  });
}

/// @nodoc
class _$OperationRequiredTestCopyWithImpl<
  $Res,
  $Val extends OperationRequiredTest
>
    implements $OperationRequiredTestCopyWith<$Res> {
  _$OperationRequiredTestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperationRequiredTest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? operationId = null,
    Object? testName = null,
    Object? isDone = freezed,
    Object? result = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            operationId: null == operationId
                ? _value.operationId
                : operationId // ignore: cast_nullable_to_non_nullable
                      as int,
            testName: null == testName
                ? _value.testName
                : testName // ignore: cast_nullable_to_non_nullable
                      as String,
            isDone: freezed == isDone
                ? _value.isDone
                : isDone // ignore: cast_nullable_to_non_nullable
                      as bool?,
            result: freezed == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$OperationRequiredTestImplCopyWith<$Res>
    implements $OperationRequiredTestCopyWith<$Res> {
  factory _$$OperationRequiredTestImplCopyWith(
    _$OperationRequiredTestImpl value,
    $Res Function(_$OperationRequiredTestImpl) then,
  ) = __$$OperationRequiredTestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int operationId,
    String testName,
    bool? isDone,
    String? result,
    String? notes,
  });
}

/// @nodoc
class __$$OperationRequiredTestImplCopyWithImpl<$Res>
    extends
        _$OperationRequiredTestCopyWithImpl<$Res, _$OperationRequiredTestImpl>
    implements _$$OperationRequiredTestImplCopyWith<$Res> {
  __$$OperationRequiredTestImplCopyWithImpl(
    _$OperationRequiredTestImpl _value,
    $Res Function(_$OperationRequiredTestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OperationRequiredTest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? operationId = null,
    Object? testName = null,
    Object? isDone = freezed,
    Object? result = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$OperationRequiredTestImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        operationId: null == operationId
            ? _value.operationId
            : operationId // ignore: cast_nullable_to_non_nullable
                  as int,
        testName: null == testName
            ? _value.testName
            : testName // ignore: cast_nullable_to_non_nullable
                  as String,
        isDone: freezed == isDone
            ? _value.isDone
            : isDone // ignore: cast_nullable_to_non_nullable
                  as bool?,
        result: freezed == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$OperationRequiredTestImpl implements _OperationRequiredTest {
  const _$OperationRequiredTestImpl({
    required this.id,
    required this.operationId,
    required this.testName,
    this.isDone,
    this.result,
    this.notes,
  });

  factory _$OperationRequiredTestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperationRequiredTestImplFromJson(json);

  @override
  final int id;
  @override
  final int operationId;
  @override
  final String testName;
  @override
  final bool? isDone;
  @override
  final String? result;
  @override
  final String? notes;

  @override
  String toString() {
    return 'OperationRequiredTest(id: $id, operationId: $operationId, testName: $testName, isDone: $isDone, result: $result, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationRequiredTestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.operationId, operationId) ||
                other.operationId == operationId) &&
            (identical(other.testName, testName) ||
                other.testName == testName) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    operationId,
    testName,
    isDone,
    result,
    notes,
  );

  /// Create a copy of OperationRequiredTest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationRequiredTestImplCopyWith<_$OperationRequiredTestImpl>
  get copyWith =>
      __$$OperationRequiredTestImplCopyWithImpl<_$OperationRequiredTestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OperationRequiredTestImplToJson(this);
  }
}

abstract class _OperationRequiredTest implements OperationRequiredTest {
  const factory _OperationRequiredTest({
    required final int id,
    required final int operationId,
    required final String testName,
    final bool? isDone,
    final String? result,
    final String? notes,
  }) = _$OperationRequiredTestImpl;

  factory _OperationRequiredTest.fromJson(Map<String, dynamic> json) =
      _$OperationRequiredTestImpl.fromJson;

  @override
  int get id;
  @override
  int get operationId;
  @override
  String get testName;
  @override
  bool? get isDone;
  @override
  String? get result;
  @override
  String? get notes;

  /// Create a copy of OperationRequiredTest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperationRequiredTestImplCopyWith<_$OperationRequiredTestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
