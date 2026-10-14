import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/queue/domain/entities/queue_entry.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart';
import 'package:doctor_clinics_app/features/queue/domain/repositories/queue_repository.dart';

part 'queue_state.dart';
part 'queue_cubit.freezed.dart';

class QueueCubit extends Cubit<QueueState> {
  final IQueueRepository repository;

  QueueCubit({required this.repository})
      : super(const QueueState.initial());

  Future<void> loadTodayQueue() async {
    // TODO: implement.
  }

  Future<void> bookAppointment(Appointment appointment) async {
    // TODO: implement.
  }

  Future<void> cancelAppointment(int id, String reason) async {
    // TODO: implement.
  }

  Future<void> addWalkIn(int patientId) async {
    // TODO: implement.
  }

  Future<void> updateStatus(int id, String status) async {
    // TODO: implement.
  }

  Future<void> reorder(int id, int newPosition) async {
    // TODO: implement.
  }

  Future<void> toggleUrgent(int id, bool isUrgent) async {
    // TODO: implement.
  }
}