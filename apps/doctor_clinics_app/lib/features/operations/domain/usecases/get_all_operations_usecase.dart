import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/domain/repositories/operation_repository.dart';

class GetAllOperationsUsecase extends UseCase<List<Operation>, NoParams> {
  final IOperationRepository repository;

  GetAllOperationsUsecase(this.repository);

  @override
  FutureResult<List<Operation>> call(NoParams params) => repository.getAll();
}
