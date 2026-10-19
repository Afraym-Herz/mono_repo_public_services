import 'package:doctor_clinics_app/features/reports/domain/entities/report.dart';

/// Builds [Report] values for [ReportRepositoryImpl]. Kept free of storage so
/// the repository only orchestrates datasource calls and in-memory history.
class ReportFactory {
  ReportFactory._();

  static const String _patientStatsType = 'patient_stats';
  static const String _revenueType = 'revenue';
  static const String _debtType = 'debt';
  static const String _visitsType = 'visits';
  static const String _expensesType = 'expenses';

  static Report patientStats(DateTime from, DateTime to, String format) =>
      _build(_patientStatsType, from, to, format);

  static Report revenue(DateTime from, DateTime to, String format) =>
      _build(_revenueType, from, to, format);

  static Report visits(DateTime from, DateTime to, String format) =>
      _build(_visitsType, from, to, format);

  static Report expenses(DateTime from, DateTime to, String format) =>
      _build(_expensesType, from, to, format);

  static Report debt(String format) {
    final now = DateTime.now();
    return Report(
      id: now.millisecondsSinceEpoch,
      type: _debtType,
      fromDate: now.subtract(const Duration(days: 30)),
      toDate: now,
      format: format,
      generatedAt: now,
      generatedBy: 1,
    );
  }

  static Report _build(
    String type,
    DateTime fromDate,
    DateTime toDate,
    String format,
  ) {
    return Report(
      id: DateTime.now().millisecondsSinceEpoch,
      type: type,
      fromDate: fromDate,
      toDate: toDate,
      format: format,
      generatedAt: DateTime.now(),
      generatedBy: 1,
    );
  }
}
