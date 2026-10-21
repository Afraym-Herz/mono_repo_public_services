// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

/// @nodoc
mixin _$Patient {
  int get id => throw _privateConstructorUsedError;
  String get fileNumber => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get searchText => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get phone2 => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get occupation => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get bloodType => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this Patient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res, Patient>;
  @useResult
  $Res call({
    int id,
    String fileNumber,
    String fullName,
    String searchText,
    String gender,
    DateTime? birthDate,
    String? phone,
    String? phone2,
    String? address,
    String? occupation,
    String? notes,
    String? bloodType,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? deletedAt,
  });
}

/// @nodoc
class _$PatientCopyWithImpl<$Res, $Val extends Patient>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileNumber = null,
    Object? fullName = null,
    Object? searchText = null,
    Object? gender = null,
    Object? birthDate = freezed,
    Object? phone = freezed,
    Object? phone2 = freezed,
    Object? address = freezed,
    Object? occupation = freezed,
    Object? notes = freezed,
    Object? bloodType = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            fileNumber: null == fileNumber
                ? _value.fileNumber
                : fileNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            searchText: null == searchText
                ? _value.searchText
                : searchText // ignore: cast_nullable_to_non_nullable
                      as String,
            gender: null == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String,
            birthDate: freezed == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone2: freezed == phone2
                ? _value.phone2
                : phone2 // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            occupation: freezed == occupation
                ? _value.occupation
                : occupation // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            bloodType: freezed == bloodType
                ? _value.bloodType
                : bloodType // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            deletedAt: freezed == deletedAt
                ? _value.deletedAt
                : deletedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PatientImplCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$$PatientImplCopyWith(
    _$PatientImpl value,
    $Res Function(_$PatientImpl) then,
  ) = __$$PatientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String fileNumber,
    String fullName,
    String searchText,
    String gender,
    DateTime? birthDate,
    String? phone,
    String? phone2,
    String? address,
    String? occupation,
    String? notes,
    String? bloodType,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? deletedAt,
  });
}

/// @nodoc
class __$$PatientImplCopyWithImpl<$Res>
    extends _$PatientCopyWithImpl<$Res, _$PatientImpl>
    implements _$$PatientImplCopyWith<$Res> {
  __$$PatientImplCopyWithImpl(
    _$PatientImpl _value,
    $Res Function(_$PatientImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileNumber = null,
    Object? fullName = null,
    Object? searchText = null,
    Object? gender = null,
    Object? birthDate = freezed,
    Object? phone = freezed,
    Object? phone2 = freezed,
    Object? address = freezed,
    Object? occupation = freezed,
    Object? notes = freezed,
    Object? bloodType = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _$PatientImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        fileNumber: null == fileNumber
            ? _value.fileNumber
            : fileNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        searchText: null == searchText
            ? _value.searchText
            : searchText // ignore: cast_nullable_to_non_nullable
                  as String,
        gender: null == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String,
        birthDate: freezed == birthDate
            ? _value.birthDate
            : birthDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone2: freezed == phone2
            ? _value.phone2
            : phone2 // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        occupation: freezed == occupation
            ? _value.occupation
            : occupation // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        bloodType: freezed == bloodType
            ? _value.bloodType
            : bloodType // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        deletedAt: freezed == deletedAt
            ? _value.deletedAt
            : deletedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientImpl implements _Patient {
  const _$PatientImpl({
    required this.id,
    required this.fileNumber,
    required this.fullName,
    required this.searchText,
    required this.gender,
    this.birthDate,
    this.phone,
    this.phone2,
    this.address,
    this.occupation,
    this.notes,
    this.bloodType,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory _$PatientImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientImplFromJson(json);

  @override
  final int id;
  @override
  final String fileNumber;
  @override
  final String fullName;
  @override
  final String searchText;
  @override
  final String gender;
  @override
  final DateTime? birthDate;
  @override
  final String? phone;
  @override
  final String? phone2;
  @override
  final String? address;
  @override
  final String? occupation;
  @override
  final String? notes;
  @override
  final String? bloodType;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Patient(id: $id, fileNumber: $fileNumber, fullName: $fullName, searchText: $searchText, gender: $gender, birthDate: $birthDate, phone: $phone, phone2: $phone2, address: $address, occupation: $occupation, notes: $notes, bloodType: $bloodType, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileNumber, fileNumber) ||
                other.fileNumber == fileNumber) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.phone2, phone2) || other.phone2 == phone2) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.bloodType, bloodType) ||
                other.bloodType == bloodType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    fileNumber,
    fullName,
    searchText,
    gender,
    birthDate,
    phone,
    phone2,
    address,
    occupation,
    notes,
    bloodType,
    createdAt,
    updatedAt,
    deletedAt,
  );

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      __$$PatientImplCopyWithImpl<_$PatientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientImplToJson(this);
  }
}

abstract class _Patient implements Patient {
  const factory _Patient({
    required final int id,
    required final String fileNumber,
    required final String fullName,
    required final String searchText,
    required final String gender,
    final DateTime? birthDate,
    final String? phone,
    final String? phone2,
    final String? address,
    final String? occupation,
    final String? notes,
    final String? bloodType,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final DateTime? deletedAt,
  }) = _$PatientImpl;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$PatientImpl.fromJson;

  @override
  int get id;
  @override
  String get fileNumber;
  @override
  String get fullName;
  @override
  String get searchText;
  @override
  String get gender;
  @override
  DateTime? get birthDate;
  @override
  String? get phone;
  @override
  String? get phone2;
  @override
  String? get address;
  @override
  String? get occupation;
  @override
  String? get notes;
  @override
  String? get bloodType;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
