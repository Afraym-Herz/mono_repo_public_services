part of 'prescription_cubit.dart';

@freezed
class PrescriptionState with _$PrescriptionState {
  const factory PrescriptionState.initial() = _Initial;
  const factory PrescriptionState.loading() = _Loading;
  const factory PrescriptionState.loaded({
    required List<Prescription> prescriptions,
  }) = _Loaded;
  const factory PrescriptionState.builder({
    required Prescription prescription,
    required List<PrescriptionItem> items,
    required List<Medicine> medicines,
  }) = _Builder;
  const factory PrescriptionState.error({
    required String message,
  }) = _Error;
}