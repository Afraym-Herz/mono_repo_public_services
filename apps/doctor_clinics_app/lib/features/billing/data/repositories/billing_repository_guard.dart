import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

/// Runs a billing datasource call, mapping thrown errors to a [CacheFailure]
/// tagged `billing.<label>`.
FutureResult<T> guardBillingValue<T>(
  String label,
  Future<T> Function() action,
) async {
  try {
    return Right(await action());
  } catch (e) {
    return Left(CacheFailure('billing.$label failed: $e'));
  }
}

/// [guardBillingValue] for `Future<void>` datasource calls.
FutureResult<void> guardBillingVoid(
  String label,
  Future<void> Function() action,
) async {
  try {
    await action();
    return const Right(null);
  } catch (e) {
    return Left(CacheFailure('billing.$label failed: $e'));
  }
}
