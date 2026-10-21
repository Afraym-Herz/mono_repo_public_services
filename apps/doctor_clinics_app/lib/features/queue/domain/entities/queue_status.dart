import 'package:core/core.dart';

enum QueueStatus {
  waiting(AppConstants.queueStatusWaiting),
  inConsultation(AppConstants.queueStatusInConsultation),
  done(AppConstants.queueStatusDone),
  cancelled(AppConstants.queueStatusCancelled),
  noShow(AppConstants.queueStatusNoShow);

  const QueueStatus(this.code);
  final String code;

  static final Map<String, QueueStatus> _byCode = {
    for (final s in values) s.code: s,
  };

  static QueueStatus? tryParse(String code) => _byCode[code];

  bool get isActive => this == waiting || this == inConsultation;
  bool get isTerminal => this == done || this == cancelled || this == noShow;
}
