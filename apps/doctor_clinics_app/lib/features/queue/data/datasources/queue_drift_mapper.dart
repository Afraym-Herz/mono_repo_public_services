import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart'
    as entity;
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_entry.dart'
    as entity;

/// Drift ↔ domain conversion shared by the queue datasource.
///
/// Keeps the datasource focused on plumbing; the field-by-field mapping for
/// appointments and queue entries lives here in one place.
class QueueDriftMapper {
  QueueDriftMapper._();

  /// Maps a Drift `Appointments` row into the domain entity.
  static entity.Appointment toDomainAppointment(Appointment row) {
    return entity.Appointment(
      id: row.id,
      patientId: row.patientId,
      scheduledDate: row.scheduledDate,
      scheduledTime: row.scheduledTime,
      type: row.type,
      status: row.status,
      reason: row.reason,
      notes: row.notes,
      cancelledReason: row.cancelledReason,
      createdBy: int.tryParse(row.createdBy) ?? 0,
      createdAt: row.scheduledDate,
      updatedAt: row.scheduledDate,
    );
  }

  /// Maps a domain appointment into a Drift insert/update companion.
  static AppointmentsCompanion toAppointmentCompanion(entity.Appointment appt) {
    return AppointmentsCompanion(
      id: appt.id > 0 ? Value(appt.id) : const Value.absent(),
      patientId: Value(appt.patientId),
      scheduledDate: Value(appt.scheduledDate),
      scheduledTime: Value(appt.scheduledTime),
      type: Value(appt.type),
      status: Value(appt.status),
      reason: Value(appt.reason),
      notes: Value(appt.notes),
      cancelledReason: Value(appt.cancelledReason),
      createdBy: Value(appt.createdBy.toString()),
    );
  }

  /// Maps a Drift `QueueEntries` row into the domain entity.
  static entity.QueueEntry toDomainQueueEntry(QueueEntry row) {
    return entity.QueueEntry(
      id: row.id,
      patientId: row.patientId,
      scheduledAt: row.queueDate,
      status: row.status,
    );
  }
}
