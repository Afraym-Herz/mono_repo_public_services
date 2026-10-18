import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../helpers/queue_day_labels.dart';
import '../helpers/queue_session.dart';

/// Today's date + active clinic session window for the queue banner.
///
/// Resolves the queue's session window here and hands the ready strings to the
/// shared [AppMetaRow] — the same calendar row the home greeting header uses.
class QueueHeaderMetaRow extends StatelessWidget {
  const QueueHeaderMetaRow({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final locale = context.locale.toString();
    final session = QueueSession.forTime(now);

    return AppMetaRow(
      label: QueueDayLabels.date(now, locale),
      detail:
          '${session.labelKey.tr()} '
          '${QueueDayLabels.timeRange(session, now, locale)}',
    );
  }
}
