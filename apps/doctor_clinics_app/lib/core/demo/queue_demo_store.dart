import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'queue_demo_patient.dart';

/// In-memory holder for the offline demo clinic day.
///
/// Loaded from [assetPath] once at startup so the home panel and the queue
/// seeder can read the dummy patients synchronously. Presentational scaffolding
/// only — the database remains the source of truth for real usage.
class QueueDemoStore {
  QueueDemoStore._();

  static final QueueDemoStore instance = QueueDemoStore._();

  static const String assetPath = 'assets/data/queue_patients.json';

  List<QueueDemoPatient> _patients = const [];
  bool _loaded = false;

  /// Every demo patient, in ticket order.
  List<QueueDemoPatient> get patients => _patients;

  /// The subset mirrored by the home dashboard mock.
  List<QueueDemoPatient> get homePatients =>
      _patients.where((p) => p.showOnHome).toList(growable: false);

  bool get isLoaded => _loaded;

  /// Reads and caches [assetPath]. Safe to call more than once.
  Future<void> prime() async {
    if (_loaded) return;
    try {
      final raw = await rootBundle.loadString(assetPath);
      final decoded = json.decode(raw);
      final list = decoded is Map<String, dynamic>
          ? decoded['patients'] as List<dynamic>
          : decoded as List<dynamic>;
      _patients = list
          .map((e) => QueueDemoPatient.fromJson(e as Map<String, dynamic>))
          .toList(growable: false);
    } catch (_) {
      _patients = const [];
    }
    _loaded = true;
  }
}
