import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_board.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_failure.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';

mixin QueueEntryOps {
  IQueueDatasource get datasource;
  FutureResult<QueueBoard> getTodayBoard() async {
    try {
      final board = await datasource.fetchTodayBoard();
      return Right(board);
    } catch (e) {
      return Left(CacheFailure('queue.getTodayBoard failed: $e'));
    }
  }

  FutureResult<void> addWalkIn(
    int patientId, {
    String? notes,
    int depositPiasters = 0,
  }) async {
    try {
      await datasource.addWalkIn(
        patientId,
        notes: notes,
        depositPiasters: depositPiasters,
      );
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('queue.addWalkIn failed: $e'));
    }
  }

  FutureResult<void> callEntry(int entryId) async {
    try {
      final ok = await datasource.transitionEntry(
        entryId: entryId,
        from: {QueueStatus.waiting},
        to: QueueStatus.inConsultation,
        appointmentStatus: AppConstants.appointmentStatusInConsultation,
        calledAt: DateTime.now(),
      );
      return ok
          ? const Right(null)
          : const Left(QueueFailure('queue_row.error.invalid_transition'));
    } on QueueFailure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(CacheFailure('queue.callEntry failed: $e'));
    }
  }

  FutureResult<void> markNoShow(int entryId) async {
    try {
      final ok = await datasource.markNoShow(entryId);
      return ok
          ? const Right(null)
          : const Left(QueueFailure('queue_row.error.invalid_transition'));
    } on QueueFailure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(CacheFailure('queue.markNoShow failed: $e'));
    }
  }

  FutureResult<void> cancelEntry(int entryId, {String? reason}) async {
    try {
      final ok = await datasource.transitionEntry(
        entryId: entryId,
        from: {QueueStatus.waiting, QueueStatus.inConsultation},
        to: QueueStatus.cancelled,
        appointmentStatus: AppConstants.appointmentStatusCancelled,
        finishedAt: DateTime.now(),
        cancelReason: reason?.trim().isNotEmpty == true
            ? reason!.trim()
            : AppConstants.queueCancelReasonStaff,
      );
      return ok
          ? const Right(null)
          : const Left(QueueFailure('queue_row.error.invalid_transition'));
    } on QueueFailure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(CacheFailure('queue.cancelEntry failed: $e'));
    }
  }
}
