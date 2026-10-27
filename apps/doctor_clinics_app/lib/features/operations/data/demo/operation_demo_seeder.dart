import 'package:drift/drift.dart';

import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/operation_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_deposit_billing.dart';
import 'package:doctor_clinics_app/features/operations/data/demo/operation_demo_specs.dart';

/// Seeds a believable surgical week when the operations table is empty.
///
/// The board reads the local Drift tables, so without fixture rows it would
/// only ever show the empty state in the offline MVP. Real rows are never
/// touched: this runs only when no operation exists.
class OperationDemoSeeder {
  OperationDemoSeeder({
    required this.operationDao,
    required this.patientDao,
    required this.billingDao,
  });

  static const String _createdBy = 'demo-operations';

  final OperationDao operationDao;
  final PatientDao patientDao;
  final BillingDao billingDao;

  Future<void> seedIfEmpty() async {
    final existing = await operationDao.getAllOperations();
    if (existing.isNotEmpty) return;

    final patients = await patientDao.getAllPatients();
    if (patients.isEmpty) return;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    for (var index = 0; index < operationDemoSpecs.length; index++) {
      final spec = operationDemoSpecs[index];
      final patient = patients[index % patients.length];
      final operationId = await _insertOperation(spec, patient.id, today, now);
      await _insertTests(spec, operationId);
      await recordOperationBilling(
        billingDao: billingDao,
        operationId: operationId,
        patientId: patient.id,
        description: spec.type,
        totalPiasters: spec.costPiasters,
        depositPiasters: spec.depositPiasters,
        createdAt: now,
        createdBy: _createdBy,
        status: spec.status,
      );
    }
  }

  Future<int> _insertOperation(
    OperationDemoSpec spec,
    int patientId,
    DateTime today,
    DateTime now,
  ) {
    return operationDao.insertOperation(
      OperationsCompanion.insert(
        patientId: patientId,
        operationType: spec.type,
        scheduledDate: today.add(Duration(days: spec.dayOffset)),
        scheduledTime: Value(spec.time),
        surgeonName: Value(spec.surgeon),
        notes: Value(spec.notes),
        status: spec.status,
        cost: spec.costPiasters,
        depositAmount: spec.depositPiasters,
        createdBy: const Value(_createdBy),
        createdAt: Value(now),
        updatedAt: Value(now),
      ),
    );
  }

  Future<void> _insertTests(OperationDemoSpec spec, int operationId) async {
    for (final (testIndex, testName) in spec.tests.indexed) {
      await operationDao.insertTest(
        OperationRequiredTestsCompanion.insert(
          operationId: operationId,
          testName: testName,
          isCompleted: Value(testIndex < spec.testsDone),
        ),
      );
    }
  }
}
