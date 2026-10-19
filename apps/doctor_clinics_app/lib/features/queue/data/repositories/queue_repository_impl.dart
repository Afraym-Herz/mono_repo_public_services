import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';
import 'package:doctor_clinics_app/features/queue/data/repositories/queue_appointment_ops.dart';
import 'package:doctor_clinics_app/features/queue/data/repositories/queue_entry_ops.dart';
import 'package:doctor_clinics_app/features/queue/data/repositories/queue_query_ops.dart';
import 'package:doctor_clinics_app/features/queue/domain/repositories/queue_repository.dart';

/// Concrete [IQueueRepository] composed from focused operation mixins.
class QueueRepositoryImpl
    with QueueAppointmentOps, QueueEntryOps, QueueQueryOps
    implements IQueueRepository {
  @override
  final IQueueDatasource datasource;

  QueueRepositoryImpl({required this.datasource});
}
