import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_failure.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';

/// Finishing operations mixed into the concrete queue repository.
mixin QueueFinishOps {
  /// Local datasource supplied by the concrete repository.
  IQueueDatasource get datasource;

  FutureResult<void> finishEntry(int entryId) async {
    try {
      final ok = await datasource.transitionEntry(
        entryId: entryId,
        from: {QueueStatus.inConsultation},
        to: QueueStatus.done,
        appointmentStatus: AppConstants.appointmentStatusDone,
        finishedAt: DateTime.now(),
      );
      return ok
          ? const Right(null)
          : const Left(QueueFailure('queue_row.error.invalid_transition'));
    } on QueueFailure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(CacheFailure('queue.finishEntry failed: $e'));
    }
  }

  FutureResult<void> finishEntryWithPayment(
    int entryId,
    int amountPiasters,
  ) async {
    try {
      final ok = await datasource.finishEntryWithPayment(
        entryId: entryId,
        amountPiasters: amountPiasters,
      );
      return ok
          ? const Right(null)
          : const Left(QueueFailure('queue_row.error.invalid_transition'));
    } on QueueFailure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(CacheFailure('queue.finishEntryWithPayment failed: $e'));
    }
  }
}
