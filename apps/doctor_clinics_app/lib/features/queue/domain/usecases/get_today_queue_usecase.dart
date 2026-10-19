import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_board.dart';
import 'package:doctor_clinics_app/features/queue/domain/repositories/queue_repository.dart';

class GetTodayQueueUsecase extends UseCase<QueueBoard, NoParams> {
  final IQueueRepository repository;

  GetTodayQueueUsecase(this.repository);

  @override
  FutureResult<QueueBoard> call(NoParams params) =>
      repository.getTodayBoard();
}
