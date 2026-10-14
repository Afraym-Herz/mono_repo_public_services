import 'package:equatable/equatable.dart';

import 'package:core/src/utils/typedefs.dart';

/// Base class for all use cases.
///
/// ```dart
/// class GetCategories extends UseCase<List<Category>, NoParams> {
///   final PosRepository repository;
///   GetCategories(this.repository);
///
///   @override
///   FutureResult<List<Category>> call(NoParams params) =>
///       repository.getCategories();
/// }
/// ```
abstract class UseCase<T, Params> {
  FutureResult<T> call(Params params);
}

/// Use when the use case does not require parameters.
class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
