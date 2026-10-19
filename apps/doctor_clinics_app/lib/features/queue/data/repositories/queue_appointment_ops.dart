import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart';

/// Appointment operations mixed into the concrete queue repository.
mixin QueueAppointmentOps {
  /// Local datasource supplied by the concrete repository.
  IQueueDatasource get datasource;

  FutureResult<List<Appointment>> getAppointmentsByDate(DateTime date) async {
    try {
      final result = await datasource.fetchAppointments(date);
      return Right(result);
    } catch (e) {
      return Left(CacheFailure('queue.getAppointmentsByDate failed: $e'));
    }
  }

  FutureResult<Appointment> bookAppointment(Appointment appointment) async {
    try {
      final id = await datasource.insertAppointment(appointment);
      return Right(appointment.copyWith(id: id));
    } catch (e) {
      return Left(CacheFailure('queue.bookAppointment failed: $e'));
    }
  }

  FutureResult<void> cancelAppointment(int id, String reason) async {
    try {
      final appointments = await datasource.fetchAppointments(DateTime.now());
      final appt = appointments.firstWhere((a) => a.id == id);
      await datasource.updateAppointment(
        appt.copyWith(
          status: AppConstants.appointmentStatusCancelled,
          cancelledReason: reason,
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('queue.cancelAppointment failed: $e'));
    }
  }

  FutureResult<void> rescheduleAppointment(
    int id,
    DateTime newDate,
    String newTime,
  ) async {
    try {
      final appointments = await datasource.fetchAppointments(DateTime.now());
      final appt = appointments.firstWhere((a) => a.id == id);
      await datasource.updateAppointment(
        appt.copyWith(scheduledDate: newDate, scheduledTime: newTime),
      );
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('queue.rescheduleAppointment failed: $e'));
    }
  }
}
