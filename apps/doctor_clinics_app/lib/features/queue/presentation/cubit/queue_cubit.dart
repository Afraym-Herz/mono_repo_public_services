import 'dart:math' as math;
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';
import 'package:doctor_clinics_app/features/queue/domain/repositories/queue_repository.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/queue_list_filter.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/queue_sort_order.dart';
import 'package:doctor_clinics_app/features/settings/domain/repositories/settings_repository.dart';

part 'queue_state.dart';
part 'queue_cubit_actions.dart';
part 'queue_cubit.freezed.dart';

class QueueCubit extends Cubit<QueueState> with QueueCubitActions {
  @override
  final IQueueRepository repository;
  final ISettingsRepository settingsRepository;

  /// Only the secretary may move patients or mark them as no-shows.
  final bool canManageQueue;

  QueueCubit({
    required this.repository,
    required this.settingsRepository,
    bool? canManageQueue,
  }) : canManageQueue = canManageQueue ?? _resolveCanManageQueue(),
       super(const QueueState.initial());

  static bool _resolveCanManageQueue() {
    try {
      final auth = getIt<AppAuthCubit>().state;
      return auth.maybeMap(
        authenticated: (s) => s.user.role == AppConstants.userRoleSecretary,
        orElse: () => false,
      );
    } catch (_) {
      return true;
    }
  }

  @override
  Future<void> loadTodayQueue() async {
    final previous = state;
    emit(const QueueState.loading());
    final boardResult = await repository.getTodayBoard();
    if (isClosed) return;
    if (boardResult.isLeft()) {
      emit(
        QueueState.error(
          message: boardResult.fold((f) => f.message, (_) => ''),
        ),
      );
      return;
    }
    final templateResult = await settingsRepository.getClinicTemplate();
    if (isClosed) return;
    final template = templateResult.fold((_) => null, (t) => t);
    final board = boardResult.fold((_) => null, (b) => b)!;
    emit(
      QueueState.loaded(
        tickets: board.tickets,
        filter: previous.listFilter,
        sortOrder: previous.listSortOrder,
        defaultFeePiasters: template?.defaultConsultationFeePiasters ?? 0,
        doctorNameAr: template?.doctorNameAr ?? '',
        doctorNameEn: template?.doctorNameEn ?? '',
      ),
    );
  }

  Future<void> refresh() async {
    final cur = state;
    cur is _Loaded ? await _reloadSilently(cur) : await loadTodayQueue();
  }

  void updateListSelection({
    QueueListFilter? filter,
    QueueSortOrder? sortOrder,
  }) => emit(state.withListSelection(filter: filter, sortOrder: sortOrder));

  void clearActionError() {
    final cur = state;
    if (cur is _Loaded) emit(cur.copyWith(actionError: null));
  }
}
