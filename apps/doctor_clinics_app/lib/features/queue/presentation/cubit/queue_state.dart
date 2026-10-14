part of 'queue_cubit.dart';

@freezed
class QueueState with _$QueueState {
  const factory QueueState.initial() = _Initial;
  const factory QueueState.loading() = _Loading;
  const factory QueueState.loaded({
    required List<QueueEntry> entries,
    required List<Appointment> appointments,
  }) = _Loaded;
  const factory QueueState.error({
    required String message,
  }) = _Error;
}