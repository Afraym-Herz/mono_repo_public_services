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
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('prescriptions.getAllMedicines failed: $e'));
    }
  }

  @override
  FutureResult<List<Medicine>> searchMedicines(String query) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('prescriptions.searchMedicines failed: $e'));
    }
  }

  @override
  FutureResult<Medicine> addMedicine(Medicine medicine) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('prescriptions.addMedicine failed: $e'));
    }
  }

  @override
  FutureResult<void> updateMedicine(Medicine medicine) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('prescriptions.updateMedicine failed: $e'));
    }
  }

  @override
  FutureResult<void> deleteMedicine(int id) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('prescriptions.deleteMedicine failed: $e'));
    }
  }

  @override
  FutureResult<List<Prescription>> getByPatient(int patientId) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('prescriptions.getByPatient failed: $e'));
    }
  }

  @override
  FutureResult<Prescription> create(Prescription prescription) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('prescriptions.create failed: $e'));
    }
  }

  @override
  FutureResult<void> addItem(PrescriptionItem item) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('prescriptions.addItem failed: $e'));
    }
  }

  @override
  FutureResult<void> removeItem(int itemId) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('prescriptions.removeItem failed: $e'));
    }
  }

  @override
  FutureResult<List<PrescriptionItem>> getItems(int prescriptionId) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('prescriptions.getItems failed: $e'));
    }
  }

  @override
  FutureResult<List<PrescriptionTemplate>> getTemplates() async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('prescriptions.getTemplates failed: $e'));
    }
  }

  @override
  FutureResult<PrescriptionTemplate> saveTemplate(
    PrescriptionTemplate template,
  ) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('prescriptions.saveTemplate failed: $e'));
    }
  }

  @override
  FutureResult<void> deleteTemplate(int id) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('prescriptions.deleteTemplate failed: $e'));
    }
  }
}
