import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/operation_dao.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_datasource.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_deposit_billing.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_drift_reads.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_mapper.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart'
    as entity;
import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart'
    as entity;

/// Concrete Drift implementation of [IOperationDatasource].
class OperationDriftDatasource
    with OperationDriftReads
    implements IOperationDatasource {
  @override
  final OperationDao dao;
  final BillingDao billingDao;

  OperationDriftDatasource(this.dao, this.billingDao);

  @override
  Future<int> insert(entity.Operation operation) => _insertWithBilling(
    operation,
    () => dao.insertOperation(OperationMapper.toOperationCompanion(operation)),
  );

  @override
  Future<int> insertWithTests(
    entity.Operation operation,
    List<String> testNames,
  ) {
    final names = testNames
        .map((name) => name.trim())
        .where((name) => name.isNotEmpty)
        .toList();
    return _insertWithBilling(
      operation,
      () => dao.insertOperationWithTests(
        OperationMapper.toOperationCompanion(operation),
        names,
      ),
    );
  }

  @override
  Future<void> update(entity.Operation operation) async {
    await dao.updateOperation(OperationMapper.toOperationCompanion(operation));
  }

  @override
  Future<void> updateWithTests(
    entity.Operation operation,
    List<String> testNames,
  ) {
    final names = testNames
        .map((name) => name.trim())
        .where((name) => name.isNotEmpty)
        .toSet()
        .toList();
    return dao.updateOperationWithTests(
      OperationMapper.toOperationCompanion(operation),
      operation.id,
      names,
    );
  }

  @override
  Future<void> softDelete(int id) async {
    await dao.softDeleteOperation(id);
  }

  @override
  Future<void> insertRequiredTest(entity.OperationRequiredTest test) async {
    await dao.insertTest(OperationMapper.toTestInsertCompanion(test));
  }

  @override
  Future<void> updateRequiredTest(entity.OperationRequiredTest test) async {
    await dao.updateTest(OperationMapper.toTestUpdateCompanion(test));
  }

  @override
  Future<void> deleteRequiredTest(int id) async {
    await dao.deleteTest(id);
  }

  /// Inserts the row and its billing rows as one transaction, so a failed
  /// invoice/payment never leaves an unbilled operation behind.
  Future<int> _insertWithBilling(
    entity.Operation operation,
    Future<int> Function() insertRow,
  ) {
    return dao.transaction(() async {
      final id = await insertRow();
      await recordOperationBilling(
        billingDao: billingDao,
        operationId: id,
        patientId: operation.patientId,
        description: operation.name,
        totalPiasters: operation.totalCostPiasters ?? 0,
        depositPiasters: operation.depositPiasters ?? 0,
        createdAt: operation.createdAt,
        createdBy: operation.createdBy.toString(),
        status: operation.status,
      );
      return id;
    });
  }
}
