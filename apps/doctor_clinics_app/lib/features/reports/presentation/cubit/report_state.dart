part of 'report_cubit.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState.initial() = _Initial;
  const factory ReportState.loading() = _Loading;
  const factory ReportState.generated({
    required Report report,
  }) = _Generated;
  const factory ReportState.history({
    required List<Report> reports,
  }) = _History;
  const factory ReportState.error({
    required String message,
  }) = _Error;
}