import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/reports/domain/entities/report.dart';

/// Contract for generating and retrieving reports.
abstract class IReportRepository {
  /// Generates a patient-statistics report.
  FutureResult<Report> generatePatientStats({
    required DateTime from,
    required DateTime to,
    required String format,
  });

  /// Generates a revenue report for a date range.
  FutureResult<Report> generateRevenueReport({
    required DateTime from,
    required DateTime to,
    required String format,
  });

  /// Generates an outstanding-debts report.
  FutureResult<Report> generateDebtReport({
    required String format,
  });

  /// Generates a visit-history report.
  FutureResult<Report> generateVisitReport({
    required DateTime from,
    required DateTime to,
    required String format,
  });

  /// Generates an expenses / net-result report.
  FutureResult<Report> generateExpenseReport({
    required DateTime from,
    required DateTime to,
    required String format,
  });

  /// Returns previously generated reports.
  FutureResult<List<Report>> getHistory();
}
