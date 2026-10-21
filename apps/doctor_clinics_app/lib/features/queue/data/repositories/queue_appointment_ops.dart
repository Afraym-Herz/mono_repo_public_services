import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_failure.dart';

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

  FutureResult<List<AppointmentListItem>> getAppointmentsInRange(
    DateTime start,
    DateTime end,
  ) async {
    try {
      final result = await datasource.fetchAppointmentsInRange(start, end);
      return Right(result);
    } catch (e) {
      return Left(CacheFailure('queue.getAppointmentsInRange failed: $e'));
    }
  }

  FutureResult<Appointment> bookAppointment(Appointment appointment) async {
    try {
      final booked = await datasource.bookAppointment(appointment);
      return Right(booked);
    } on QueueFailure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(CacheFailure('queue.bookAppointment failed: $e'));
    }
  }

  FutureResult<void> cancelAppointment(int id, String reason) async {
    try {
      await datasource.cancelAppointment(id, reason);
      return const Right(null);
    } on QueueFailure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(CacheFailure('queue.cancelAppointment failed: $e'));
    }
  }

  FutureResult<void> rescheduleAppointment(int id, DateTime newDate) async {
    try {
      await datasource.rescheduleAppointment(id, newDate);
      return const Right(null);
    } on QueueFailure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(CacheFailure('queue.rescheduleAppointment failed: $e'));
    }
  }
}
