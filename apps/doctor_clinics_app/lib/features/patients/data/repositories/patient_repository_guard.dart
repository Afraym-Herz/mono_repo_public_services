import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

/// Runs a patients datasource call and converts any thrown error into a
/// [CacheFailure] whose message matches the original inline guards:
/// `patients.<operation> failed: <error>`.
FutureResult<void> guardPatientVoid(
  String operation,
  Future<void> Function() run,
) async {
  try {
    await run();
    return const Right(null);
  } catch (e) {
    return Left(CacheFailure('patients.$operation failed: $e'));
  }
}

/// Value-returning counterpart of [guardPatientVoid].
FutureResult<T> guardPatient<T>(
  String operation,
  Future<T> Function() run,
) async {
  try {
    return Right(await run());
  } catch (e) {
    return Left(CacheFailure('patients.$operation failed: $e'));
  }
}
