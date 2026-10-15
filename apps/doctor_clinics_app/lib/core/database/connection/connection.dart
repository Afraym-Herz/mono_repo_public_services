import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../db_constants.dart';

/// Database connection helper for native platforms (Windows desktop first).
QueryExecutor openConnection({String dbName = DbConstants.dbName}) {
  return driftDatabase(name: dbName);
}
