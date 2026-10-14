import 'package:doctor_clinics_app/features/reports/domain/entities/report.dart';
import 'package:doctor_clinics_app/features/reports/domain/repositories/report_repository.dart';
import 'package:doctor_clinics_app/features/reports/data/datasources/report_datasource.dart';

class ReportRepositoryImpl implements IReportRepository {
  final IReportDatasource datasource;

  ReportRepositoryImpl({required this.datasource});

  @override
  Future<Report> generatePatientStats({
    required DateTime from,
    required DateTime to,
    required String format,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Report> generateRevenueReport({
    required DateTime from,
    required DateTime to,
    required String format,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Report> generateDebtReport({
    required String format,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Report> generateVisitReport({
    required DateTime from,
    required DateTime to,
    required String format,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Report> generateExpenseReport({
    required DateTime from,
    required DateTime to,
    required String format,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<Report>> getHistory() {
    throw UnimplementedError();
  }
}