import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../db_constants.dart';

/// Database connection for every platform.
///
/// Native platforms store `$dbName.sqlite` in the app documents directory.
/// Web uses the WASM sqlite build + worker shipped in `web/`
/// (`sqlite3.wasm`, `drift_worker.js`), persisting via OPFS/IndexedDB.
/// The `web` options are ignored on native platforms — but omitting them
/// throws `ArgumentError` on web at the first query.
QueryExecutor openConnection({String dbName = DbConstants.dbName}) {
  return driftDatabase(
    name: dbName,
    web: DriftWebOptions(
      sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      driftWorker: Uri.parse('drift_worker.js'),
    ),
  );
}
