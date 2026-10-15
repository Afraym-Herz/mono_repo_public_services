import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/medicine.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_item.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_template.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/repositories/prescription_repository.dart';
import 'package:doctor_clinics_app/features/prescriptions/data/datasources/prescription_datasource.dart';

class PrescriptionRepositoryImpl implements IPrescriptionRepository {
  final IPrescriptionDatasource datasource;

  PrescriptionRepositoryImpl({required this.datasource});

  @override
  FutureResult<List<Medicine>> getAllMedicines() async {
    try {
      final list = await datasource.fetchAllMedicines();
      return Right(list);
    } catch (e) {
      return Left(CacheFailure('prescriptions.getAllMedicines failed: $e'));
    }
  }

  @override
  FutureResult<List<Medicine>> searchMedicines(String query) async {
    try {
      final list = await datasource.searchMedicines(query);
      return Right(list);
    } catch (e) {
      return Left(CacheFailure('prescriptions.searchMedicines failed: $e'));
    }
  }

  @override
  FutureResult<Medicine> addMedicine(Medicine medicine) async {
    try {
      final id = await datasource.insertMedicine(medicine);
      return Right(medicine.copyWith(id: id));
    } catch (e) {
      return Left(CacheFailure('prescriptions.addMedicine failed: $e'));
    }
  }

  @override
  FutureResult<void> updateMedicine(Medicine medicine) async {
    try {
      await datasource.updateMedicine(medicine);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('prescriptions.updateMedicine failed: $e'));
    }
  }

  @override
  FutureResult<void> deleteMedicine(int id) async {
    try {
      await datasource.softDeleteMedicine(id);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('prescriptions.deleteMedicine failed: $e'));
    }
  }

  @override
  FutureResult<List<Prescription>> getByPatient(int patientId) async {
    try {
      final list = await datasource.fetchByPatient(patientId);
      return Right(list);
    } catch (e) {
      return Left(CacheFailure('prescriptions.getByPatient failed: $e'));
    }
  }

  @override
  FutureResult<Prescription> create(Prescription prescription) async {
    try {
      final id = await datasource.insertPrescription(prescription);
      return Right(prescription.copyWith(id: id));
    } catch (e) {
      return Left(CacheFailure('prescriptions.create failed: $e'));
    }
  }

  @override
  FutureResult<void> addItem(PrescriptionItem item) async {
    try {
      await datasource.insertItem(item);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('prescriptions.addItem failed: $e'));
    }
  }

  @override
  FutureResult<void> removeItem(int itemId) async {
    try {
      await datasource.deleteItem(itemId);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('prescriptions.removeItem failed: $e'));
    }
  }

  @override
  FutureResult<List<PrescriptionItem>> getItems(int prescriptionId) async {
    try {
      final list = await datasource.fetchItems(prescriptionId);
      return Right(list);
    } catch (e) {
      return Left(CacheFailure('prescriptions.getItems failed: $e'));
    }
  }

  @override
  FutureResult<List<PrescriptionTemplate>> getTemplates() async {
    try {
      final list = await datasource.fetchTemplates();
      return Right(list);
    } catch (e) {
      return Left(CacheFailure('prescriptions.getTemplates failed: $e'));
    }
  }

  @override
  FutureResult<PrescriptionTemplate> saveTemplate(
    PrescriptionTemplate template,
  ) async {
    try {
      final id = await datasource.insertTemplate(template);
      return Right(template.copyWith(id: id));
    } catch (e) {
      return Left(CacheFailure('prescriptions.saveTemplate failed: $e'));
    }
  }

  @override
  FutureResult<void> deleteTemplate(int id) async {
    try {
      await datasource.deleteTemplate(id);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('prescriptions.deleteTemplate failed: $e'));
    }
  }
}
