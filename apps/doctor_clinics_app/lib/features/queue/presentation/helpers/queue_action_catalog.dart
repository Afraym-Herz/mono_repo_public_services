import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_action.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/queue_row_state.dart';

/// Labels and role filtering for queue row actions.
class QueueActionCatalog {
  QueueActionCatalog._();

  static List<QueueAction> visible(
    QueueRowState rowState, {
    required bool canManage,
  }) {
    if (canManage) return rowState.availableActions;
    return rowState.availableActions
        .where(
          (action) =>
              action == QueueAction.call ||
              action == QueueAction.finish ||
              action == QueueAction.collect,
        )
        .toList();
  }

  static String label(QueueAction action) => switch (action) {
    QueueAction.markNoShow => 'queue_row.action.no_show'.tr(),
    QueueAction.call => 'queue_row.action.call'.tr(),
    QueueAction.advance => 'queue_row.action.advance'.tr(),
    QueueAction.cancel => 'queue_row.action.cancel'.tr(),
    QueueAction.restore => 'queue_row.action.restore'.tr(),
    QueueAction.finish => 'queue_row.action.finish'.tr(),
    QueueAction.collect => 'queue_row.action.collect'.tr(),
    QueueAction.toggleUrgent => 'queue_row.status.urgent'.tr(),
  };
}
