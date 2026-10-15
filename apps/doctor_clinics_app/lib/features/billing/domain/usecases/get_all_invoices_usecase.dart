import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';

class GetAllInvoicesUsecase extends UseCase<List<Invoice>, NoParams> {
  final IBillingRepository repository;

  GetAllInvoicesUsecase(this.repository);

  @override
  FutureResult<List<Invoice>> call(NoParams params) =>
      repository.getAllInvoices();
}
