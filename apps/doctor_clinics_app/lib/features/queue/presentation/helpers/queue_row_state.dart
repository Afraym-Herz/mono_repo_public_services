import 'package:doctor_clinics_app/features/queue/domain/entities/queue_action.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';

enum QueueRowState {
  current,
  urgent,
  waiting,
  done,
  collected,
  cancelled,
  booked,
}

extension QueueTicketRowX on QueueTicket {
  QueueRowState get rowState {
    if (status == QueueStatus.inConsultation) return QueueRowState.current;
    if (status == QueueStatus.cancelled) return QueueRowState.cancelled;
    if (status == QueueStatus.done) {
      return paidAt == null ? QueueRowState.done : QueueRowState.collected;
    }
    if (isUrgent) return QueueRowState.urgent;
    return QueueRowState.waiting;
  }
}

extension QueueRowStateActionsX on QueueRowState {
  QueueAction? get primaryAction {
    switch (this) {
      case QueueRowState.current:
        return QueueAction.finish;
      case QueueRowState.urgent:
      case QueueRowState.waiting:
        return QueueAction.call;
      case QueueRowState.booked:
        return QueueAction.checkIn;
      case QueueRowState.done:
        return QueueAction.collect;
      case QueueRowState.cancelled:
        return QueueAction.restore;
      case QueueRowState.collected:
        return null;
    }
  }

  QueueAction? get secondaryAction {
    switch (this) {
      case QueueRowState.urgent:
      case QueueRowState.waiting:
        return QueueAction.advance;
      default:
        return null;
    }
  }

  List<QueueAction> get availableActions {
    switch (this) {
      case QueueRowState.current:
        return const [QueueAction.finish];
      case QueueRowState.urgent:
      case QueueRowState.waiting:
        return const [QueueAction.call, QueueAction.advance, QueueAction.cancel];
      case QueueRowState.booked:
        return const [QueueAction.checkIn, QueueAction.cancel];
      case QueueRowState.done:
        return const [QueueAction.collect, QueueAction.restore];
      case QueueRowState.collected:
        return const [];
      case QueueRowState.cancelled:
        return const [QueueAction.restore];
    }
  }
}
