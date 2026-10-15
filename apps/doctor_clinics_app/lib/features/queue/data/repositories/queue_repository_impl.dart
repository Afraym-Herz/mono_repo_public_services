import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_entry.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart';
import 'package:doctor_clinics_app/features/queue/domain/repositories/queue_repository.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';

class QueueRepositoryImpl implements IQueueRepository {
  final IQueueDatasource datasource;

  QueueRepositoryImpl({required this.datasource});

  @override
  FutureResult<List<Appointment>> getAppointmentsByDate(DateTime date) async {
    try {
      final result = await datasource.fetchAppointments(date);
      return Right(result);
    } catch (e) {
      return Left(CacheFailure('queue.getAppointmentsByDate failed: $e'));
    }
  }

  @override
  FutureResult<Appointment> bookAppointment(Appointment appointment) async {
    try {
      final id = await datasource.insertAppointment(appointment);
      return Right(appointment.copyWith(id: id));
    } catch (e) {
      return Left(CacheFailure('queue.bookAppointment failed: $e'));
    }
  }

  @override
  FutureResult<void> cancelAppointment(int id, String reason) async {
    try {
      final appointments =
          await datasource.fetchAppointments(DateTime.now());
      final appt = appointments.firstWhere((a) => a.id == id);
      await datasource.updateAppointment(
        appt.copyWith(status: 'cancelled', cancelledReason: reason),
      );
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('queue.cancelAppointment failed: $e'));
    }
  }

  @override
  FutureResult<void> rescheduleAppointment(
    int id,
    DateTime newDate,
    String newTime,
  ) async {
    try {
      final appointments =
          await datasource.fetchAppointments(DateTime.now());
      final appt = appointments.firstWhere((a) => a.id == id);
      await datasource.updateAppointment(
        appt.copyWith(scheduledDate: newDate, scheduledTime: newTime),
      );
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('queue.rescheduleAppointment failed: $e'));
    }
  }

  @override
  FutureResult<List<QueueEntry>> getTodayQueue() async {
    try {
      final entries = await datasource.fetchQueueByDate(DateTime.now());
      return Right(entries);
    } catch (e) {
      return Left(CacheFailure('queue.getTodayQueue failed: $e'));
    }
  }

  @override
  FutureResult<QueueEntry> addToQueue(int appointmentId) async {
    try {
      final entry = QueueEntry(
        id: 0,
        patientId: 0,
        scheduledAt: DateTime.now(),
        status: 'waiting',
      );
      final id = await datasource.insertQueueEntry(entry);
      return Right(entry.copyWith(id: id));
    } catch (e) {
      return Left(CacheFailure('queue.addToQueue failed: $e'));
    }
  }

  @override
  FutureResult<void> addWalkIn(int patientId) async {
    try {
      final entry = QueueEntry(
        id: 0,
        patientId: patientId,
        scheduledAt: DateTime.now(),
        status: 'waiting',
      );
      await datasource.insertQueueEntry(entry);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('queue.addWalkIn failed: $e'));
    }
  }

  @override
  FutureResult<void> updateQueueStatus(int id, String status) async {
    try {
      final entries = await datasource.fetchQueueByDate(DateTime.now());
      final entry = entries.firstWhere((e) => e.id == id);
      await datasource.updateQueueEntry(entry.copyWith(status: status));
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('queue.updateQueueStatus failed: $e'));
    }
  }

  @override
  FutureResult<void> reorderQueue(int id, int newPosition) async {
    try {
      // Reorder queues in-memory / datasource
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('queue.reorderQueue failed: $e'));
    }
  }

  @override
  FutureResult<void> markUrgent(int id, bool isUrgent) async {
    try {
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('queue.markUrgent failed: $e'));
    }
  }

  @override
  FutureResult<int> nextQueueNumber(DateTime date) async {
    try {
      final count = await datasource.countQueueForDate(date);
      return Right(count + 1);
    } catch (e) {
      return Left(CacheFailure('queue.nextQueueNumber failed: $e'));
    }
  }

  @override
  FutureResult<bool> isSlotAvailable(DateTime date, String time) async {
    try {
      final appointments = await datasource.fetchAppointments(date);
      final isTaken = appointments.any((a) =>
          a.scheduledTime == time && a.status != 'cancelled');
      return Right(!isTaken);
    } catch (e) {
      return Left(CacheFailure('queue.isSlotAvailable failed: $e'));
    }
  }
}
