import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/reports/data/datasources/report_datasource.dart';
import 'package:doctor_clinics_app/features/reports/data/repositories/report_factory.dart';
import 'package:doctor_clinics_app/features/reports/domain/entities/report.dart';
import 'package:doctor_clinics_app/features/reports/domain/repositories/report_repository.dart';

class ReportRepositoryImpl implements IReportRepository {
  final IReportDatasource datasource;
  final List<Report> _inMemoryHistory = [];

  ReportRepositoryImpl({required this.datasource});

  @override
  FutureResult<Report> generatePatientStats({
    required DateTime from,
    required DateTime to,
    required String format,
  }) async {
    try {
      await datasource.countPatients(from: from, to: to);
      final report = ReportFactory.patientStats(from, to, format);
      _inMemoryHistory.add(report);
      return Right(report);
    } catch (e) {
      return Left(CacheFailure('reports.generatePatientStats failed: $e'));
    }
  }

  @override
  FutureResult<Report> generateRevenueReport({
    required DateTime from,
    required DateTime to,
    required String format,
  }) async {
    try {
      await datasource.totalRevenuePiasters(from: from, to: to);
      final report = ReportFactory.revenue(from, to, format);
      _inMemoryHistory.add(report);
      return Right(report);
    } catch (e) {
      return Left(CacheFailure('reports.generateRevenueReport failed: $e'));
    }
  }

  @override
  FutureResult<Report> generateDebtReport({required String format}) async {
    try {
      await datasource.totalOutstandingPiasters();
      final report = ReportFactory.debt(format);
      _inMemoryHistory.add(report);
      return Right(report);
    } catch (e) {
      return Left(CacheFailure('reports.generateDebtReport failed: $e'));
    }
  }

  @override
  FutureResult<Report> generateVisitReport({
    required DateTime from,
    required DateTime to,
    required String format,
  }) async {
    try {
      await datasource.countVisits(from: from, to: to);
      final report = ReportFactory.visits(from, to, format);
      _inMemoryHistory.add(report);
      return Right(report);
    } catch (e) {
      return Left(CacheFailure('reports.generateVisitReport failed: $e'));
    }
  }

  @override
  FutureResult<Report> generateExpenseReport({
    required DateTime from,
    required DateTime to,
    required String format,
  }) async {
    try {
      await datasource.totalExpensesPiasters(from: from, to: to);
      final report = ReportFactory.expenses(from, to, format);
      _inMemoryHistory.add(report);
      return Right(report);
    } catch (e) {
      return Left(CacheFailure('reports.generateExpenseReport failed: $e'));
    }
  }

  @override
  FutureResult<List<Report>> getHistory() async {
    try {
      return Right(List.unmodifiable(_inMemoryHistory));
    } catch (e) {
      return Left(CacheFailure('reports.getHistory failed: $e'));
    }
  }
}
