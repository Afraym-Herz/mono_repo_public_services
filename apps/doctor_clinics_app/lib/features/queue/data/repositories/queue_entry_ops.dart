import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_entry.dart';

/// Queue-entry operations mixed into the concrete queue repository.
mixin QueueEntryOps {
  /// Local datasource supplied by the concrete repository.
  IQueueDatasource get datasource;

  FutureResult<List<QueueEntry>> getTodayQueue() async {
    try {
      final entries = await datasource.fetchQueueByDate(DateTime.now());
      return Right(entries);
    } catch (e) {
      return Left(CacheFailure('queue.getTodayQueue failed: $e'));
    }
  }

  FutureResult<QueueEntry> addToQueue(int appointmentId) async {
    try {
      final entry = QueueEntry(
        id: 0,
        patientId: 0,
        scheduledAt: DateTime.now(),
        status: AppConstants.queueStatusWaiting,
      );
      final id = await datasource.insertQueueEntry(entry);
      return Right(entry.copyWith(id: id));
    } catch (e) {
      return Left(CacheFailure('queue.addToQueue failed: $e'));
    }
  }

  FutureResult<void> addWalkIn(int patientId) async {
    try {
      final entry = QueueEntry(
        id: 0,
        patientId: patientId,
        scheduledAt: DateTime.now(),
        status: AppConstants.queueStatusWaiting,
      );
      await datasource.insertQueueEntry(entry);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('queue.addWalkIn failed: $e'));
    }
  }

  FutureResult<void> updateQueueStatus(int id, String status) async {
    try {
      final entries = await datasource.fetchQueueByDate(DateTime.now());
      final entry = entries.firstWhere((e) => e.id == id);
      await datasource.updateQueueEntry(entry.copyWith(status: status));
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('queue.updateQueueStatus failed: $e'));
    }
  }

  FutureResult<void> reorderQueue(int id, int newPosition) async {
    try {
      // Reorder queues in-memory / datasource
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('queue.reorderQueue failed: $e'));
    }
  }

  FutureResult<void> markUrgent(int id, bool isUrgent) async {
    try {
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('queue.markUrgent failed: $e'));
    }
  }
}
