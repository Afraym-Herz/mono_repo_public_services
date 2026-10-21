import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';

/// Query helpers mixed into the concrete queue repository.
mixin QueueQueryOps {
  /// Local datasource supplied by the concrete repository.
  IQueueDatasource get datasource;

  FutureResult<int> nextQueueNumber(DateTime date) async {
    try {
      final number = await datasource.nextQueueNumber(date);
      return Right(number);
    } catch (e) {
      return Left(CacheFailure('queue.nextQueueNumber failed: $e'));
    }
  }
}
