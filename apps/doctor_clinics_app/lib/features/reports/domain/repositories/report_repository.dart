import 'package:doctor_clinics_app/features/reports/domain/entities/report.dart';

/// Contract for generating and retrieving reports.
abstract class IReportRepository {
  /// Generates a patient-statistics report.
  Future<Report> generatePatientStats({
    required DateTime from,
    required DateTime to,
    required String format,
  });

  /// Generates a revenue report for a date range.
  Future<Report> generateRevenueReport({
    required DateTime from,
    required DateTime to,
    required String format,
  });

  /// Generates an outstanding-debts report.
  Future<Report> generateDebtReport({
    required String format,
  });

  /// Generates a visit-history report.
  Future<Report> generateVisitReport({
    required DateTime from,
    required DateTime to,
    required String format,
  });

  /// Generates an expenses / net-result report.
  Future<Report> generateExpenseReport({
    required DateTime from,
    required DateTime to,
    required String format,
  });

  /// Returns previously generated reports.
  Future<List<Report>> getHistory();
}