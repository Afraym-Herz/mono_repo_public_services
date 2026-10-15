import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
import 'package:doctor_clinics_app/features/reports/data/datasources/report_datasource.dart';

/// Drift-backed stub of [IReportDatasource] (aggregation queries).
class ReportDriftDatasource implements IReportDatasource {
  final BillingDao billingDao;
  final PatientDao patientDao;
  ReportDriftDatasource(this.billingDao, this.patientDao);

  @override
  Future<int> countPatients({DateTime? from, DateTime? to}) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> countVisits({DateTime? from, DateTime? to}) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> totalRevenuePiasters({DateTime? from, DateTime? to}) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> totalExpensesPiasters({DateTime? from, DateTime? to}) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> totalOutstandingPiasters() async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<Map<String, int>> revenueByDay({
    required DateTime from,
    required DateTime to,
  }) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }
}
