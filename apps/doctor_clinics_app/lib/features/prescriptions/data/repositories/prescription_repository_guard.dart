import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

/// Runs a prescriptions datasource call and converts any thrown error into a
/// [CacheFailure] whose message matches the original inline guards:
/// `prescriptions.<operation> failed: <error>`.
FutureResult<void> guardPrescriptionVoid(
  String operation,
  Future<void> Function() run,
) async {
  try {
    await run();
    return const Right(null);
  } catch (e) {
    return Left(CacheFailure('prescriptions.$operation failed: $e'));
  }
}

/// Value-returning counterpart of [guardPrescriptionVoid].
FutureResult<T> guardPrescription<T>(
  String operation,
  Future<T> Function() run,
) async {
  try {
    return Right(await run());
  } catch (e) {
    return Left(CacheFailure('prescriptions.$operation failed: $e'));
  }
}
