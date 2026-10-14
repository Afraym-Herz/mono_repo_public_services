import 'dart:developer' as developer;

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:agreements/core/errors/failure_model.dart';

/// Encrypts and stores sensitive data (tokens, headers, credentials)
/// using platform-native secure storage (Keychain / Keystore).
class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  Future<Either<Failure, Unit>> writeSecureData(
    String key,
    String value,
  ) async {
    try {
      await _storage.write(key: key, value: value);
      developer.log('Wrote key: $key', name: 'SecureStorage');
      return const Right(unit);
    } catch (e) {
      developer.log('Write failed ($key): $e', name: 'SecureStorage');
      return Left(CacheFailure('Failed to write secure data: $e'));
    }
  }

  Future<Either<Failure, String?>> readSecureData(String key) async {
    try {
      final value = await _storage.read(key: key);
      return Right(value);
    } catch (e) {
      developer.log('Read failed ($key): $e', name: 'SecureStorage');
      return Left(CacheFailure('Failed to read secure data: $e'));
    }
  }

  Future<Either<Failure, Unit>> deleteSecureData(String key) async {
    try {
      await _storage.delete(key: key);
      developer.log('Deleted key: $key', name: 'SecureStorage');
      return const Right(unit);
    } catch (e) {
      developer.log('Delete failed ($key): $e', name: 'SecureStorage');
      return Left(CacheFailure('Failed to delete secure data: $e'));
    }
  }

  Future<Either<Failure, Unit>> deleteAllSecureData() async {
    try {
      await _storage.deleteAll();
      developer.log('Cleared all secure storage', name: 'SecureStorage');
      return const Right(unit);
    } catch (e) {
      developer.log('Clear all failed: $e', name: 'SecureStorage');
      return Left(CacheFailure('Failed to clear secure storage: $e'));
    }
  }

  Future<Either<Failure, bool>> containsKey(String key) async {
    try {
      final exists = await _storage.containsKey(key: key);
      return Right(exists);
    } catch (e) {
      developer.log('ContainsKey failed ($key): $e', name: 'SecureStorage');
      return Left(CacheFailure('Failed to check key existence: $e'));
    }
  }
}
