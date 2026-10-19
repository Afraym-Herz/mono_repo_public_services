import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/queue_row_data.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart'
    as entity;
import 'package:doctor_clinics_app/features/queue/domain/entities/booked_appointment.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';

class QueueDriftMapper {
  QueueDriftMapper._();

  static QueueTicket toQueueTicket(QueueEntryRowData row) => QueueTicket(
    entryId: row.entry.id,
    appointmentId: row.entry.appointmentId,
    patientId: row.entry.patientId,
    queueNumber: row.entry.queueNumber,
    position: row.entry.position,
    status: QueueStatus.tryParse(row.entry.status) ?? QueueStatus.waiting,
    isUrgent: row.entry.isUrgent,
    arrivedAt: row.entry.arrivedAt,
    calledAt: row.entry.calledAt,
    finishedAt: row.entry.finishedAt,
    patientName: row.patient.fullName,
    patientPhone: row.patient.phone,
    fileNumber: row.patient.fileNumber,
    appointmentType: row.appointment?.type,
    scheduledTime: row.appointment?.scheduledTime,
    paidAt: row.entry.paidAt,
    paidAmountPiasters: row.entry.paidAmountPiasters,
    cancelReason: row.entry.cancelReason,
  );

  static BookedAppointment toBooked(BookedAppointmentRowData row) =>
      BookedAppointment(
        appointmentId: row.appointment.id,
        patientId: row.patient.id,
        patientName: row.patient.fullName,
        patientPhone: row.patient.phone,
        fileNumber: row.patient.fileNumber,
        scheduledTime: row.appointment.scheduledTime,
        type: row.appointment.type,
      );

  static entity.Appointment toDomainAppointment(Appointment row) =>
      entity.Appointment(
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

  static AppointmentsCompanion toAppointmentCompanion(entity.Appointment appt) =>
      AppointmentsCompanion(
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
