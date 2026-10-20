part of 'queue_dao.dart';

extension QueueDaoAppointmentRange on QueueDao {
  Future<List<Appointment>> getAppointmentsInRange(
    DateTime start,
    DateTime end,
  ) {
    return (select(appointments)
          ..where(
            (a) =>
                a.scheduledDate.isBiggerOrEqualValue(start) &
                a.scheduledDate.isSmallerThanValue(end),
          )
          ..orderBy([
            (a) => OrderingTerm.asc(a.scheduledDate),
            (a) => OrderingTerm.asc(a.queueNumber),
            (a) => OrderingTerm.asc(a.id),
          ]))
        .get();
  }

  Future<List<AppointmentRowData>> getAppointmentRowsInRange(
    DateTime start,
    DateTime end,
  ) async {
    final query =
        select(appointments).join([
            innerJoin(patients, patients.id.equalsExp(appointments.patientId)),
          ])
          ..where(
            appointments.scheduledDate.isBiggerOrEqualValue(start) &
                appointments.scheduledDate.isSmallerThanValue(end),
          )
          ..orderBy([
            OrderingTerm.asc(appointments.scheduledDate),
            OrderingTerm.asc(appointments.queueNumber),
            OrderingTerm.asc(appointments.id),
          ]);
    final rows = await query.get();
    return rows
        .map(
          (r) => AppointmentRowData(
            r.readTable(appointments),
            r.readTable(patients),
          ),
        )
        .toList();
  }
}
