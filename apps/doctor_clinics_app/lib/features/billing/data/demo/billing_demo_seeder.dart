import 'dart:math' as math;

import 'package:core/core.dart';
import 'package:drift/drift.dart';

import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/queue_dao.dart';
import 'package:doctor_clinics_app/features/queue/data/demo/demo_month_schedule.dart';
import 'package:doctor_clinics_app/features/queue/data/demo/demo_today_seed.dart';

/// Turns the demo appointments and queue visits into invoices and receipts, so
/// the accounts workspace reflects the same clinic activity the queue and
/// appointment planner show.
///
/// Only rows written by the queue demo seeders are billed. Real appointments
/// and invoices are never modified, and every demo invoice is keyed by its
/// appointment id so re-running the seeder never duplicates it.
class BillingDemoSeeder {
  BillingDemoSeeder({required this.billingDao, required this.queueDao});

  final BillingDao billingDao;
  final QueueDao queueDao;

  static const String _invoicePrefix = 'DEMO-VISIT';
  static const String _receiptPrefix = 'DEMO-RCPT';
  static const String _createdBy = 'demo-billing';

  static const Set<String> _demoAppointmentMarkers = {
    DemoTodaySeed.marker,
    DemoMonthSchedule.marker,
  };

  Future<void> seedIfEmpty() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final existing = await billingDao.getAllInvoices();
    final existingNumbers = existing
        .map((invoice) => invoice.invoiceNumber)
        .toSet();
    final appointments =
        (await queueDao.getAppointmentsInRange(
          today.subtract(const Duration(days: 29)),
          today.add(const Duration(days: 1)),
        )).where((appointment) {
          return _demoAppointmentMarkers.contains(appointment.createdBy) &&
              appointment.status != AppConstants.appointmentStatusCancelled;
        }).toList();
    if (appointments.isEmpty) return;

    final queueEntries = await queueDao.getQueueForDate(today);
    final entryByAppointment = {
      for (final entry in queueEntries)
        if (entry.appointmentId != null) entry.appointmentId!: entry,
    };

    for (final appointment in appointments) {
      final entry = entryByAppointment[appointment.id];
      if (entry?.status == AppConstants.queueStatusCancelled) continue;

      final invoiceNumber = '$_invoicePrefix-${appointment.id}';
      if (existingNumbers.contains(invoiceNumber)) continue;

      await _seedVisit(appointment, entry, today, invoiceNumber);
    }
  }

  Future<void> _seedVisit(
    Appointment appointment,
    QueueEntry? entry,
    DateTime today,
    String invoiceNumber,
  ) async {
    final baseFee = _feeFor(appointment.type);
    final visitDate = _visitDate(appointment, entry);
    final isPast = appointment.scheduledDate.isBefore(today);
    final deposit = appointment.depositPiasters;
    final collected = entry?.paidAmountPiasters ?? 0;
    // Past completed visits are settled in full; today's rows use the deposit
    // plus whatever the queue recorded when the consultation was finished.
    final paid = isPast
        ? math.max(baseFee, deposit)
        : math.max(0, deposit + collected);
    final total = math.max(baseFee, paid);
    final settled = math.min(total, paid);

    final invoiceId = await billingDao.insertInvoice(
      InvoicesCompanion.insert(
        patientId: Value(appointment.patientId),
        invoiceNumber: invoiceNumber,
        totalAmount: total,
        discountAmount: 0,
        // The accounts read model keeps the settled amount in netAmount.
        netAmount: settled,
        status: _invoiceStatus(settled, total),
        createdAt: Value(visitDate),
      ),
    );

    await billingDao.insertInvoiceItem(
      InvoiceItemsCompanion.insert(
        invoiceId: invoiceId,
        itemType: AppConstants.invoiceItemTypeConsultation,
        description: _statementFor(appointment.type),
        quantity: 1,
        unitPrice: total,
        totalPrice: total,
      ),
    );

    final depositPaid = math.min(deposit, settled);
    if (depositPaid > 0) {
      await _insertPayment(
        invoiceId: invoiceId,
        patientId: appointment.patientId,
        amount: depositPaid,
        method: AppConstants.paymentMethodCash,
        date: visitDate,
        receiptNumber: '$_receiptPrefix-${appointment.id}-D',
      );
    }

    final remainingPaid = settled - depositPaid;
    if (remainingPaid > 0) {
      await _insertPayment(
        invoiceId: invoiceId,
        patientId: appointment.patientId,
        amount: remainingPaid,
        method: _methodFor(appointment.id),
        date: visitDate,
        receiptNumber: '$_receiptPrefix-${appointment.id}-F',
      );
    }
  }

  Future<void> _insertPayment({
    required int invoiceId,
    required int patientId,
    required int amount,
    required String method,
    required DateTime date,
    required String receiptNumber,
  }) {
    return billingDao.insertPayment(
      PaymentsCompanion.insert(
        invoiceId: invoiceId,
        patientId: Value(patientId),
        receiptNumber: receiptNumber,
        amount: amount,
        paymentMethod: method,
        notes: const Value('Demo visit receipt'),
        createdBy: _createdBy,
        createdAt: Value(date),
      ),
    );
  }

  /// Day-only demo appointments have no clock time, so spread them through the
  /// morning to keep the hourly chart readable.
  static DateTime _visitDate(Appointment appointment, QueueEntry? entry) {
    final recorded = entry?.finishedAt ?? entry?.calledAt ?? entry?.arrivedAt;
    if (recorded != null) return recorded;

    final scheduled = appointment.scheduledTime.split(':');
    final scheduledHour = int.tryParse(scheduled.first);
    if (scheduledHour != null) {
      final minute = int.tryParse(scheduled.length > 1 ? scheduled[1] : '');
      return DateTime(
        appointment.scheduledDate.year,
        appointment.scheduledDate.month,
        appointment.scheduledDate.day,
        scheduledHour,
        minute ?? 0,
      );
    }

    final number = appointment.queueNumber ?? 1;
    return DateTime(
      appointment.scheduledDate.year,
      appointment.scheduledDate.month,
      appointment.scheduledDate.day,
      9,
    ).add(Duration(minutes: (number - 1) * 30));
  }

  static int _feeFor(String appointmentType) => switch (appointmentType) {
    AppConstants.appointmentTypeWalkIn => 40000,
    AppConstants.appointmentTypeFollowUp => 30000,
    _ => 35000,
  };

  static String _statementFor(String appointmentType) =>
      switch (appointmentType) {
        AppConstants.appointmentTypeWalkIn => 'كشف عيادة - بدون موعد',
        AppConstants.appointmentTypeFollowUp => 'متابعة',
        _ => 'كشف عيادة',
      };

  static String _methodFor(int appointmentId) => switch (appointmentId % 4) {
    0 => AppConstants.paymentMethodCard,
    1 => AppConstants.paymentMethodTransfer,
    _ => AppConstants.paymentMethodCash,
  };

  static String _invoiceStatus(int paid, int total) {
    if (paid <= 0) return AppConstants.invoiceStatusPending;
    return paid >= total
        ? AppConstants.invoiceStatusPaid
        : AppConstants.invoiceStatusPartiallyPaid;
  }
}
