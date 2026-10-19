// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queue_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$QueueState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<QueueTicket> tickets,
      List<BookedAppointment> booked,
      QueueListFilter filter,
      QueueSortOrder sortOrder,
      int defaultFeePiasters,
      String doctorNameAr,
      String doctorNameEn,
      bool isSubmitting,
      String? actionError,
    )
    loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<QueueTicket> tickets,
      List<BookedAppointment> booked,
      QueueListFilter filter,
      QueueSortOrder sortOrder,
      int defaultFeePiasters,
      String doctorNameAr,
      String doctorNameEn,
      bool isSubmitting,
      String? actionError,
    )?
    loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<QueueTicket> tickets,
      List<BookedAppointment> booked,
      QueueListFilter filter,
      QueueSortOrder sortOrder,
      int defaultFeePiasters,
      String doctorNameAr,
      String doctorNameEn,
      bool isSubmitting,
      String? actionError,
    )?
    loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueueStateCopyWith<$Res> {
  factory $QueueStateCopyWith(
    QueueState value,
    $Res Function(QueueState) then,
  ) = _$QueueStateCopyWithImpl<$Res, QueueState>;
}

/// @nodoc
class _$QueueStateCopyWithImpl<$Res, $Val extends QueueState>
    implements $QueueStateCopyWith<$Res> {
  _$QueueStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QueueState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$QueueStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QueueState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'QueueState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<QueueTicket> tickets,
      List<BookedAppointment> booked,
      QueueListFilter filter,
      QueueSortOrder sortOrder,
      int defaultFeePiasters,
      String doctorNameAr,
      String doctorNameEn,
      bool isSubmitting,
      String? actionError,
    )
    loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<QueueTicket> tickets,
      List<BookedAppointment> booked,
      QueueListFilter filter,
      QueueSortOrder sortOrder,
      int defaultFeePiasters,
      String doctorNameAr,
      String doctorNameEn,
      bool isSubmitting,
      String? actionError,
    )?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<QueueTicket> tickets,
      List<BookedAppointment> booked,
      QueueListFilter filter,
      QueueSortOrder sortOrder,
      int defaultFeePiasters,
      String doctorNameAr,
      String doctorNameEn,
      bool isSubmitting,
      String? actionError,
    )?
    loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements QueueState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$QueueStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QueueState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'QueueState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<QueueTicket> tickets,
      List<BookedAppointment> booked,
      QueueListFilter filter,
      QueueSortOrder sortOrder,
      int defaultFeePiasters,
      String doctorNameAr,
      String doctorNameEn,
      bool isSubmitting,
      String? actionError,
    )
    loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<QueueTicket> tickets,
      List<BookedAppointment> booked,
      QueueListFilter filter,
      QueueSortOrder sortOrder,
      int defaultFeePiasters,
      String doctorNameAr,
      String doctorNameEn,
      bool isSubmitting,
      String? actionError,
    )?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<QueueTicket> tickets,
      List<BookedAppointment> booked,
      QueueListFilter filter,
      QueueSortOrder sortOrder,
      int defaultFeePiasters,
      String doctorNameAr,
      String doctorNameEn,
      bool isSubmitting,
      String? actionError,
    )?
    loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements QueueState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    List<QueueTicket> tickets,
    List<BookedAppointment> booked,
    QueueListFilter filter,
    QueueSortOrder sortOrder,
    int defaultFeePiasters,
    String doctorNameAr,
    String doctorNameEn,
    bool isSubmitting,
    String? actionError,
  });
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$QueueStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QueueState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = null,
    Object? booked = null,
    Object? filter = null,
    Object? sortOrder = null,
    Object? defaultFeePiasters = null,
    Object? doctorNameAr = null,
    Object? doctorNameEn = null,
    Object? isSubmitting = null,
    Object? actionError = freezed,
  }) {
    return _then(
      _$LoadedImpl(
        tickets: null == tickets
            ? _value._tickets
            : tickets // ignore: cast_nullable_to_non_nullable
                  as List<QueueTicket>,
        booked: null == booked
            ? _value._booked
            : booked // ignore: cast_nullable_to_non_nullable
                  as List<BookedAppointment>,
        filter: null == filter
            ? _value.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as QueueListFilter,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as QueueSortOrder,
        defaultFeePiasters: null == defaultFeePiasters
            ? _value.defaultFeePiasters
            : defaultFeePiasters // ignore: cast_nullable_to_non_nullable
                  as int,
        doctorNameAr: null == doctorNameAr
            ? _value.doctorNameAr
            : doctorNameAr // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorNameEn: null == doctorNameEn
            ? _value.doctorNameEn
            : doctorNameEn // ignore: cast_nullable_to_non_nullable
                  as String,
        isSubmitting: null == isSubmitting
            ? _value.isSubmitting
            : isSubmitting // ignore: cast_nullable_to_non_nullable
                  as bool,
        actionError: freezed == actionError
            ? _value.actionError
            : actionError // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({
    required final List<QueueTicket> tickets,
    required final List<BookedAppointment> booked,
    this.filter = QueueListFilter.all,
    this.sortOrder = QueueSortOrder.ticketAscending,
    this.defaultFeePiasters = 0,
    this.doctorNameAr = '',
    this.doctorNameEn = '',
    this.isSubmitting = false,
    this.actionError,
  }) : _tickets = tickets,
       _booked = booked;

  final List<QueueTicket> _tickets;
  @override
  List<QueueTicket> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  final List<BookedAppointment> _booked;
  @override
  List<BookedAppointment> get booked {
    if (_booked is EqualUnmodifiableListView) return _booked;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_booked);
  }

  @override
  @JsonKey()
  final QueueListFilter filter;
  @override
  @JsonKey()
  final QueueSortOrder sortOrder;
  @override
  @JsonKey()
  final int defaultFeePiasters;
  @override
  @JsonKey()
  final String doctorNameAr;
  @override
  @JsonKey()
  final String doctorNameEn;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  final String? actionError;

  @override
  String toString() {
    return 'QueueState.loaded(tickets: $tickets, booked: $booked, filter: $filter, sortOrder: $sortOrder, defaultFeePiasters: $defaultFeePiasters, doctorNameAr: $doctorNameAr, doctorNameEn: $doctorNameEn, isSubmitting: $isSubmitting, actionError: $actionError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            const DeepCollectionEquality().equals(other._booked, _booked) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.defaultFeePiasters, defaultFeePiasters) ||
                other.defaultFeePiasters == defaultFeePiasters) &&
            (identical(other.doctorNameAr, doctorNameAr) ||
                other.doctorNameAr == doctorNameAr) &&
            (identical(other.doctorNameEn, doctorNameEn) ||
                other.doctorNameEn == doctorNameEn) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_tickets),
    const DeepCollectionEquality().hash(_booked),
    filter,
    sortOrder,
    defaultFeePiasters,
    doctorNameAr,
    doctorNameEn,
    isSubmitting,
    actionError,
  );

  /// Create a copy of QueueState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<QueueTicket> tickets,
      List<BookedAppointment> booked,
      QueueListFilter filter,
      QueueSortOrder sortOrder,
      int defaultFeePiasters,
      String doctorNameAr,
      String doctorNameEn,
      bool isSubmitting,
      String? actionError,
    )
    loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(
      tickets,
      booked,
      filter,
      sortOrder,
      defaultFeePiasters,
      doctorNameAr,
      doctorNameEn,
      isSubmitting,
      actionError,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<QueueTicket> tickets,
      List<BookedAppointment> booked,
      QueueListFilter filter,
      QueueSortOrder sortOrder,
      int defaultFeePiasters,
      String doctorNameAr,
      String doctorNameEn,
      bool isSubmitting,
      String? actionError,
    )?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(
      tickets,
      booked,
      filter,
      sortOrder,
      defaultFeePiasters,
      doctorNameAr,
      doctorNameEn,
      isSubmitting,
      actionError,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<QueueTicket> tickets,
      List<BookedAppointment> booked,
      QueueListFilter filter,
      QueueSortOrder sortOrder,
      int defaultFeePiasters,
      String doctorNameAr,
      String doctorNameEn,
      bool isSubmitting,
      String? actionError,
    )?
    loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
        tickets,
        booked,
        filter,
        sortOrder,
        defaultFeePiasters,
        doctorNameAr,
        doctorNameEn,
        isSubmitting,
        actionError,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements QueueState {
  const factory _Loaded({
    required final List<QueueTicket> tickets,
    required final List<BookedAppointment> booked,
    final QueueListFilter filter,
    final QueueSortOrder sortOrder,
    final int defaultFeePiasters,
    final String doctorNameAr,
    final String doctorNameEn,
    final bool isSubmitting,
    final String? actionError,
  }) = _$LoadedImpl;

  List<QueueTicket> get tickets;
  List<BookedAppointment> get booked;
  QueueListFilter get filter;
  QueueSortOrder get sortOrder;
  int get defaultFeePiasters;
  String get doctorNameAr;
  String get doctorNameEn;
  bool get isSubmitting;
  String? get actionError;

  /// Create a copy of QueueState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$QueueStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QueueState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'QueueState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of QueueState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<QueueTicket> tickets,
      List<BookedAppointment> booked,
      QueueListFilter filter,
      QueueSortOrder sortOrder,
      int defaultFeePiasters,
      String doctorNameAr,
      String doctorNameEn,
      bool isSubmitting,
      String? actionError,
    )
    loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<QueueTicket> tickets,
      List<BookedAppointment> booked,
      QueueListFilter filter,
      QueueSortOrder sortOrder,
      int defaultFeePiasters,
      String doctorNameAr,
      String doctorNameEn,
      bool isSubmitting,
      String? actionError,
    )?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<QueueTicket> tickets,
      List<BookedAppointment> booked,
      QueueListFilter filter,
      QueueSortOrder sortOrder,
      int defaultFeePiasters,
      String doctorNameAr,
      String doctorNameEn,
      bool isSubmitting,
      String? actionError,
    )?
    loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements QueueState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;

  /// Create a copy of QueueState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
