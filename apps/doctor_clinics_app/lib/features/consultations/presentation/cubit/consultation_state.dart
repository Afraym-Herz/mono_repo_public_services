part of 'consultation_cubit.dart';

@freezed
class ConsultationState with _$ConsultationState {
  const factory ConsultationState.initial() = _Initial;
  const factory ConsultationState.loading() = _Loading;
  const factory ConsultationState.loaded({
    required List<Consultation> consultations,
  }) = _Loaded;
  const factory ConsultationState.detail({
    required Consultation consultation,
    VitalSigns? vitals,
  }) = _Detail;
  const factory ConsultationState.error({
    required String message,
  }) = _Error;
}