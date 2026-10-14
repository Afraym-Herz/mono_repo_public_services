import 'package:doctor_clinics_app/features/queue/domain/entities/queue_entry.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart';
import 'package:doctor_clinics_app/features/queue/domain/repositories/queue_repository.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';

class QueueRepositoryImpl implements IQueueRepository {
  final IQueueDatasource datasource;

  QueueRepositoryImpl({required this.datasource});

  @override
  Future<List<Appointment>> getAppointmentsByDate(DateTime date) {
    throw UnimplementedError();
  }

  @override
  Future<Appointment> bookAppointment(Appointment appointment) {
    throw UnimplementedError();
  }

  @override
  Future<void> cancelAppointment(int id, String reason) {
    throw UnimplementedError();
  }

  @override
  Future<void> rescheduleAppointment(
    int id,
    DateTime newDate,
    String newTime,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<List<QueueEntry>> getTodayQueue() {
    throw UnimplementedError();
  }

  @override
  Future<QueueEntry> addToQueue(int appointmentId) {
    throw UnimplementedError();
  }

  @override
  Future<void> addWalkIn(int patientId) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateQueueStatus(int id, String status) {
    throw UnimplementedError();
  }

  @override
  Future<void> reorderQueue(int id, int newPosition) {
    throw UnimplementedError();
  }

  @override
  Future<void> markUrgent(int id, bool isUrgent) {
    throw UnimplementedError();
  }

  @override
  Future<int> nextQueueNumber(DateTime date) {
    throw UnimplementedError();
  }

  @override
  Future<bool> isSlotAvailable(DateTime date, String time) {
    throw UnimplementedError();
  }
}