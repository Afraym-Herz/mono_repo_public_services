import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/reports/domain/entities/report.dart';
import 'package:doctor_clinics_app/features/reports/domain/repositories/report_repository.dart';

class GetReportHistoryUsecase extends UseCase<List<Report>, NoParams> {
  final IReportRepository repository;

  GetReportHistoryUsecase(this.repository);

  @override
  FutureResult<List<Report>> call(NoParams params) => repository.getHistory();
}
