import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/reports/domain/entities/report.dart';
import 'package:doctor_clinics_app/features/reports/domain/repositories/report_repository.dart';

part 'report_state.dart';
part 'report_cubit.freezed.dart';

class ReportCubit extends Cubit<ReportState> {
  final IReportRepository repository;

  ReportCubit({required this.repository})
      : super(const ReportState.initial());

  Future<void> generatePatientStats({
    required DateTime from,
    required DateTime to,
    required String format,
  }) async {
    emit(const ReportState.loading());
    final result = await repository.generatePatientStats(
      from: from,
      to: to,
      format: format,
    );
    result.fold(
      (failure) => emit(ReportState.error(message: failure.message)),
      (report) => emit(ReportState.generated(report: report)),
    );
  }

  Future<void> generateRevenueReport({
    required DateTime from,
    required DateTime to,
    required String format,
  }) async {
    emit(const ReportState.loading());
    final result = await repository.generateRevenueReport(
      from: from,
      to: to,
      format: format,
    );
    result.fold(
      (failure) => emit(ReportState.error(message: failure.message)),
      (report) => emit(ReportState.generated(report: report)),
    );
  }

  Future<void> generateDebtReport({
    required String format,
  }) async {
    emit(const ReportState.loading());
    final result = await repository.generateDebtReport(format: format);
    result.fold(
      (failure) => emit(ReportState.error(message: failure.message)),
      (report) => emit(ReportState.generated(report: report)),
    );
  }

  Future<void> loadHistory() async {
    emit(const ReportState.loading());
    final result = await repository.getHistory();
    result.fold(
      (failure) => emit(ReportState.error(message: failure.message)),
      (reports) => emit(ReportState.history(reports: reports)),
    );
  }
}