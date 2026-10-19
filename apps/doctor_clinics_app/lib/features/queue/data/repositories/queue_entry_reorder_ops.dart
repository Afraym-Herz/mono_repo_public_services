import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_failure.dart';

mixin QueueEntryReorderOps {
  IQueueDatasource get datasource;

  FutureResult<void> restoreEntry(int entryId) async {
    try {
      final ok = await datasource.restoreEntry(entryId);
      return ok
          ? const Right(null)
          : const Left(QueueFailure('queue_row.error.invalid_transition'));
    } on QueueFailure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(CacheFailure('queue.restoreEntry failed: $e'));
    }
  }

  FutureResult<void> collectEntry(int entryId, int amountPiasters) async {
    try {
      final ok = await datasource.collectEntry(entryId, amountPiasters);
      return ok
          ? const Right(null)
          : const Left(QueueFailure('queue_row.error.invalid_transition'));
    } on QueueFailure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(CacheFailure('queue.collectEntry failed: $e'));
    }
  }

  FutureResult<void> advanceEntry(int entryId) async {
    try {
      final ok = await datasource.advanceEntry(entryId);
      return ok
          ? const Right(null)
          : const Left(QueueFailure('queue_row.error.invalid_transition'));
    } catch (e) {
      return Left(CacheFailure('queue.advanceEntry failed: $e'));
    }
  }

  FutureResult<void> setUrgent(int entryId, bool urgent) async {
    try {
      await datasource.setUrgent(entryId, urgent);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('queue.setUrgent failed: $e'));
    }
  }

  FutureResult<void> reorderWaiting(List<int> orderedEntryIds) async {
    try {
      final ok = await datasource.reorderWaiting(orderedEntryIds);
      return ok
          ? const Right(null)
          : const Left(QueueFailure('queue_row.error.board_changed'));
    } catch (e) {
      return Left(CacheFailure('queue.reorderWaiting failed: $e'));
    }
  }
}
