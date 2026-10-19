import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import 'package:doctor_clinics_app/core/demo/queue_demo_patient.dart';
import 'package:doctor_clinics_app/core/demo/queue_demo_store.dart';
import 'home_queue_action.dart';
import 'home_queue_status.dart';

/// One row in the home "current queue" panel.
///
/// Built from the shared dummy clinic day (`assets/data/queue_patients.json`)
/// until the panel reads the live queue feed.
class HomeQueueSampleRow {
  const HomeQueueSampleRow({
    required this.number,
    required this.name,
    required this.status,
    required this.examTypeKey,
    required this.action,
    this.waitMinutes,
    this.appointmentTime,
  });

  /// Ticket number shown in the leading badge.
  final int number;

  /// Patient display name.
  final String name;

  /// Status shown in the chip.
  final HomeQueueStatus status;

  /// `.tr()` key for the exam/visit type.
  final String examTypeKey;

  /// Quick action offered on the row.
  final HomeQueueAction action;

  /// Minutes waiting, for arrived patients.
  final int? waitMinutes;

  /// Confirmed slot (`١٠:٣٠ م`) for booked patients.
  final String? appointmentTime;
}

/// The home-panel subset of the demo patients, mapped to view rows.
List<HomeQueueSampleRow> homeQueueSampleRows(BuildContext context) =>
    QueueDemoStore.instance.homePatients
        .map((patient) => _toRow(patient, context))
        .toList(growable: false);

HomeQueueSampleRow _toRow(QueueDemoPatient patient, BuildContext context) =>
    HomeQueueSampleRow(
      number: patient.number,
      name: patient.name,
      status: _statusFor(patient),
      examTypeKey: patient.examTypeKey ?? 'home_queue_exam_general',
      action: _actionFor(patient.homeAction),
      waitMinutes: patient.waitMinutes,
      appointmentTime: patient.scheduledTime == null
          ? null
          : DateConverter.localizedSlot(
              patient.scheduledTime!,
              context.locale.toString(),
            ),
    );

HomeQueueStatus _statusFor(QueueDemoPatient patient) {
  if (patient.isBooked) return HomeQueueStatus.booked;
  if (patient.isUrgent) return HomeQueueStatus.urgent;
  switch (patient.status) {
    case AppConstants.queueStatusInConsultation:
      return HomeQueueStatus.inConsultation;
    case AppConstants.queueStatusDone:
      return HomeQueueStatus.done;
    default:
      return HomeQueueStatus.waiting;
  }
}

HomeQueueAction _actionFor(String? action) => HomeQueueAction.values.firstWhere(
      (candidate) => candidate.name == action,
      orElse: () => HomeQueueAction.more,
    );
