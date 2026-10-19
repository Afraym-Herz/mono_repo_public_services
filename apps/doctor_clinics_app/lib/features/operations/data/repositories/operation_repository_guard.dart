import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

/// Runs an operations datasource call, mapping thrown errors to a
/// [CacheFailure] tagged `operations.<label>`.
FutureResult<T> guardOperationValue<T>(
  String label,
  Future<T> Function() action,
) async {
  try {
    return Right(await action());
  } catch (e) {
    return Left(CacheFailure('operations.$label failed: $e'));
  }
}

/// [guardOperationValue] for `Future<void>` datasource calls.
FutureResult<void> guardOperationVoid(
  String label,
  Future<void> Function() action,
) async {
  try {
    await action();
    return const Right(null);
  } catch (e) {
    return Left(CacheFailure('operations.$label failed: $e'));
  }
}
