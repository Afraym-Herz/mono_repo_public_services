import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart';
import 'package:doctor_clinics_app/features/queue/domain/repositories/queue_repository.dart';

class BookAppointmentUsecase
    extends UseCase<Appointment, BookAppointmentParams> {
  final IQueueRepository repository;

  BookAppointmentUsecase(this.repository);

  @override
  FutureResult<Appointment> call(BookAppointmentParams params) =>
      repository.bookAppointment(params.appointment);
}

class BookAppointmentParams {
  final Appointment appointment;

  const BookAppointmentParams(this.appointment);
}
