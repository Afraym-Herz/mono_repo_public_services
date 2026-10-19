import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/queue/domain/entities/queue_entry.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart';
import 'package:doctor_clinics_app/features/queue/domain/repositories/queue_repository.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/queue_list_filter.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/queue_sort_order.dart';

part 'queue_state.dart';
part 'queue_cubit.freezed.dart';

class QueueCubit extends Cubit<QueueState> {
  final IQueueRepository repository;

  QueueCubit({required this.repository})
      : super(const QueueState.initial());

  Future<void> loadTodayQueue() async {
    final previous = state;
    emit(const QueueState.loading());
    final queueResult = await repository.getTodayQueue();
    final apptsResult =
        await repository.getAppointmentsByDate(DateTime.now());

    if (queueResult.isLeft()) {
      emit(
        QueueState.error(
          message: queueResult.fold((f) => f.message, (_) => ''),
        ),
      );
      return;
    }

    final entries = queueResult.fold((_) => <QueueEntry>[], (e) => e);
    final appointments =
        apptsResult.fold((_) => <Appointment>[], (a) => a);

    emit(previous.withEntries(entries, appointments));
  }

  /// Re-reads today's queue, keeping the active tab and ordering.
  Future<void> refresh() => loadTodayQueue();

  /// Updates the tab / ticket ordering docked at the head of the queue list.
  void updateListSelection({QueueListFilter? filter, QueueSortOrder? sortOrder}) =>
      emit(state.withListSelection(filter: filter, sortOrder: sortOrder));

  Future<void> bookAppointment(Appointment appointment) async {
    emit(const QueueState.loading());
    final result = await repository.bookAppointment(appointment);
    result.fold(
      (failure) => emit(QueueState.error(message: failure.message)),
      (_) => loadTodayQueue(),
    );
  }

  Future<void> cancelAppointment(int id, String reason) async {
    emit(const QueueState.loading());
    final result = await repository.cancelAppointment(id, reason);
    result.fold(
      (failure) => emit(QueueState.error(message: failure.message)),
      (_) => loadTodayQueue(),
    );
  }

  Future<void> addWalkIn(int patientId) async {
    emit(const QueueState.loading());
    final result = await repository.addWalkIn(patientId);
    result.fold(
      (failure) => emit(QueueState.error(message: failure.message)),
      (_) => loadTodayQueue(),
    );
  }

  Future<void> updateStatus(int id, String status) async {
    final result = await repository.updateQueueStatus(id, status);
    result.fold(
      (failure) => emit(QueueState.error(message: failure.message)),
      (_) => loadTodayQueue(),
    );
  }

  Future<void> reorder(int id, int newPosition) async {
    final result = await repository.reorderQueue(id, newPosition);
    result.fold(
      (failure) => emit(QueueState.error(message: failure.message)),
      (_) => loadTodayQueue(),
    );
  }

  Future<void> toggleUrgent(int id, bool isUrgent) async {
    final result = await repository.markUrgent(id, isUrgent);
    result.fold(
      (failure) => emit(QueueState.error(message: failure.message)),
      (_) => loadTodayQueue(),
    );
  }
}