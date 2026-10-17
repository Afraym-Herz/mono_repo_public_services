import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

/// Salted, iterated SHA-256 hashing for the offline local account.
///
/// Stored format: `sha256$<iterations>$<saltB64>$<digestB64>` so the salt and
/// iteration count travel with the hash and can evolve without breaking
/// accounts created by an older build. Plaintext passwords are never stored.
class PasswordHasher {
  PasswordHasher._();

  static const String _algorithm = 'sha256';
  static const int _iterations = 10000;
  static const int _saltLength = 16;
  static const int _separator = 0x24; // '$'

  /// Hashes [password] with a fresh random salt.
  static String hash(String password) {
    final salt = _randomSalt();
    final digest = _derive(password, salt, _iterations);
    return '$_algorithm\$$_iterations\$${base64Encode(salt)}\$${base64Encode(digest)}';
  }

  /// Returns `true` when [password] matches the encoded [stored] hash.
  static bool verify(String password, String stored) {
    final parts = stored.split(String.fromCharCode(_separator));
    if (parts.length != 4 || parts[0] != _algorithm) return false;
    final iterations = int.tryParse(parts[1]);
    if (iterations == null || iterations <= 0) return false;
    final salt = _tryDecode(parts[2]);
    final expected = _tryDecode(parts[3]);
    if (salt == null || expected == null || expected.isEmpty) return false;
    return _constantTimeEquals(_derive(password, salt, iterations), expected);
  }

  static List<int> _randomSalt() {
    final random = Random.secure();
    return List<int>.generate(_saltLength, (_) => random.nextInt(256));
  }

  static List<int> _derive(String password, List<int> salt, int iterations) {
    var digest = sha256.convert([...salt, ...utf8.encode(password)]).bytes;
    for (var i = 1; i < iterations; i++) {
      digest = sha256.convert([...salt, ...digest]).bytes;
    }
    return digest;
  }

  static List<int>? _tryDecode(String value) {
    try {
      return base64Decode(value);
    } on FormatException {
      return null;
    }
  }

  static bool _constantTimeEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    var difference = 0;
    for (var i = 0; i < a.length; i++) {
      difference |= a[i] ^ b[i];
    }
    return difference == 0;
  }
}
