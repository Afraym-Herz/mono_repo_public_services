import 'package:dartz/dartz.dart';
import 'package:core/src/errors/failure_model.dart';

/// Shorthand for the Either type used throughout the app.
///
/// ```dart
/// FutureResult<UserModel> login(String email, String password);
/// ```
typedef FutureResult<T> = Future<Either<Failure, T>>;

/// Synchronous version.
typedef Result<T> = Either<Failure, T>;

/// JSON map alias.
typedef JsonMap = Map<String, dynamic>;
