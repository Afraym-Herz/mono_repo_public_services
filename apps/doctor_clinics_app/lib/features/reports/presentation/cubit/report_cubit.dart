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
    // TODO: implement.
  }

  Future<void> generateRevenueReport({
    required DateTime from,
    required DateTime to,
    required String format,
  }) async {
    // TODO: implement.
  }

  Future<void> generateDebtReport({
    required String format,
  }) async {
    // TODO: implement.
  }

  Future<void> loadHistory() async {
    // TODO: implement.
  }
}