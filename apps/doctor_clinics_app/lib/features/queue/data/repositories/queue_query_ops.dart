import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';

/// Query helpers mixed into the concrete queue repository.
mixin QueueQueryOps {
  /// Local datasource supplied by the concrete repository.
  IQueueDatasource get datasource;

  FutureResult<int> nextQueueNumber(DateTime date) async {
    try {
      final count = await datasource.countQueueForDate(date);
      return Right(count + 1);
    } catch (e) {
      return Left(CacheFailure('queue.nextQueueNumber failed: $e'));
    }
  }

  FutureResult<bool> isSlotAvailable(DateTime date, String time) async {
    try {
      final appointments = await datasource.fetchAppointments(date);
      final isTaken = appointments.any(
        (a) =>
            a.scheduledTime == time &&
            a.status != AppConstants.appointmentStatusCancelled,
      );
      return Right(!isTaken);
    } catch (e) {
      return Left(CacheFailure('queue.isSlotAvailable failed: $e'));
    }
  }
}
