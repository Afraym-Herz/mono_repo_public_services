import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_entry.dart';
import 'package:doctor_clinics_app/features/queue/domain/repositories/queue_repository.dart';

class GetTodayQueueUsecase extends UseCase<List<QueueEntry>, NoParams> {
  final IQueueRepository repository;

  GetTodayQueueUsecase(this.repository);

  @override
  FutureResult<List<QueueEntry>> call(NoParams params) =>
      repository.getTodayQueue();
}
