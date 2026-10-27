import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_controller.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_validators.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';

/// Reads the edited record into the form and builds the entity back out.
extension OperationFormValues on OperationFormController {
  /// Fills every field from the record being edited.
  void populate(OperationEntry entry) {
    final operation = entry.operation;
    original = operation;
    patientId.value = operation.patientId;
    name.text = operation.name;
    surgeon.text = operation.surgeonName ?? '';
    cost.text = OperationFormValidators.fromPiasters(
      operation.totalCostPiasters,
    );
    deposit.text = OperationFormValidators.fromPiasters(
      operation.depositPiasters,
    );
    notes.text = operation.notes ?? '';
    date.value = operation.scheduledDate;
    time.value = _parseTime(operation.scheduledTime);
    tests.value = [for (final test in entry.tests) test.testName];
  }

  /// Builds the entity to persist; edit mode keeps the id, status and audit
  /// columns of the original row.
  Operation toOperation() {
    final now = DateTime.now();
    final row = original;
    return Operation(
      id: row?.id ?? 0,
      patientId: patientId.value!,
      name: name.text.trim(),
      scheduledDate: date.value,
      scheduledTime: _formatTime(time.value),
      surgeonName: surgeon.text.trim().isEmpty ? null : surgeon.text.trim(),
      notes: notes.text.trim().isEmpty ? null : notes.text.trim(),
      status: row?.status ?? AppConstants.operationStatusScheduled,
      depositPiasters: OperationFormValidators.toPiasters(deposit.text),
      totalCostPiasters: OperationFormValidators.toPiasters(cost.text),
      createdBy: row?.createdBy ?? 0,
      createdAt: row?.createdAt ?? now,
      updatedAt: now,
      deletedAt: row?.deletedAt,
    );
  }
}

String? _formatTime(TimeOfDay? value) {
  if (value == null) return null;
  final hour = value.hour.toString().padLeft(2, '0');
  final minute = value.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

TimeOfDay? _parseTime(String? slot) {
  final parts = (slot ?? '').split(':');
  if (parts.length != 2) return null;
  final hour = int.tryParse(parts[0].trim());
  final minute = int.tryParse(parts[1].trim());
  if (hour == null || minute == null || hour > 23 || minute > 59) {
    return null;
  }
  return TimeOfDay(hour: hour, minute: minute);
}
