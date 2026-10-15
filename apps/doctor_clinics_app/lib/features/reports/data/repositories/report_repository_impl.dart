import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/reports/domain/entities/report.dart';
import 'package:doctor_clinics_app/features/reports/domain/repositories/report_repository.dart';
import 'package:doctor_clinics_app/features/reports/data/datasources/report_datasource.dart';

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
      final report = Report(
        id: DateTime.now().millisecondsSinceEpoch,
        type: 'patient_stats',
        fromDate: from,
        toDate: to,
        format: format,
        generatedAt: DateTime.now(),
        generatedBy: 1,
      );
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
      final report = Report(
        id: DateTime.now().millisecondsSinceEpoch,
        type: 'revenue',
        fromDate: from,
        toDate: to,
        format: format,
        generatedAt: DateTime.now(),
        generatedBy: 1,
      );
      _inMemoryHistory.add(report);
      return Right(report);
    } catch (e) {
      return Left(CacheFailure('reports.generateRevenueReport failed: $e'));
    }
  }

  @override
  FutureResult<Report> generateDebtReport({
    required String format,
  }) async {
    try {
      await datasource.totalOutstandingPiasters();
      final now = DateTime.now();
      final report = Report(
        id: now.millisecondsSinceEpoch,
        type: 'debt',
        fromDate: now.subtract(const Duration(days: 30)),
        toDate: now,
        format: format,
        generatedAt: now,
        generatedBy: 1,
      );
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
      final report = Report(
        id: DateTime.now().millisecondsSinceEpoch,
        type: 'visits',
        fromDate: from,
        toDate: to,
        format: format,
        generatedAt: DateTime.now(),
        generatedBy: 1,
      );
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
      final report = Report(
        id: DateTime.now().millisecondsSinceEpoch,
        type: 'expenses',
        fromDate: from,
        toDate: to,
        format: format,
        generatedAt: DateTime.now(),
        generatedBy: 1,
      );
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
