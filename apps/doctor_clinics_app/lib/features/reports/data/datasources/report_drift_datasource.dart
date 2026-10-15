import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
import 'package:doctor_clinics_app/features/reports/data/datasources/report_datasource.dart';

/// Concrete Drift implementation of [IReportDatasource] (aggregation queries).
class ReportDriftDatasource implements IReportDatasource {
  final BillingDao billingDao;
  final PatientDao patientDao;

  ReportDriftDatasource(this.billingDao, this.patientDao);

  @override
  Future<int> countPatients({DateTime? from, DateTime? to}) async {
    final patients = await patientDao.getAllPatients();
    if (from == null && to == null) return patients.length;
    return patients.where((p) {
      if (from != null && p.createdAt.isBefore(from)) return false;
      if (to != null && p.createdAt.isAfter(to)) return false;
      return true;
    }).length;
  }

  @override
  Future<int> countVisits({DateTime? from, DateTime? to}) async {
    final invoices = await billingDao.getAllInvoices();
    if (from == null && to == null) return invoices.length;
    return invoices.where((i) {
      if (from != null && i.createdAt.isBefore(from)) return false;
      if (to != null && i.createdAt.isAfter(to)) return false;
      return true;
    }).length;
  }

  @override
  Future<int> totalRevenuePiasters({DateTime? from, DateTime? to}) async {
    final payments = await billingDao.getAllPayments();
    var total = 0;
    for (final p in payments) {
      if (from != null && p.createdAt.isBefore(from)) continue;
      if (to != null && p.createdAt.isAfter(to)) continue;
      total += p.amount;
    }
    return total;
  }

  @override
  Future<int> totalExpensesPiasters({DateTime? from, DateTime? to}) async {
    final expenses = await billingDao.getAllExpenses();
    var total = 0;
    for (final e in expenses) {
      if (from != null && e.expenseDate.isBefore(from)) continue;
      if (to != null && e.expenseDate.isAfter(to)) continue;
      total += e.amount;
    }
    return total;
  }

  @override
  Future<int> totalOutstandingPiasters() async {
    final outstanding = await billingDao.getOutstandingInvoices();
    var total = 0;
    for (final inv in outstanding) {
      total += (inv.totalAmount - inv.netAmount);
    }
    return total;
  }

  @override
  Future<Map<String, int>> revenueByDay({
    required DateTime from,
    required DateTime to,
  }) async {
    final payments = await billingDao.getAllPayments();
    final Map<String, int> daily = {};
    for (final p in payments) {
      if (p.createdAt.isBefore(from) || p.createdAt.isAfter(to)) continue;
      final key =
          '${p.createdAt.year}-${p.createdAt.month.toString().padLeft(2, '0')}-${p.createdAt.day.toString().padLeft(2, '0')}';
      daily[key] = (daily[key] ?? 0) + p.amount;
    }
    return daily;
  }
}
