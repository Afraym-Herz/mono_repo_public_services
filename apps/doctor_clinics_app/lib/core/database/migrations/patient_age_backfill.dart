part of '../app_database.dart';

/// Copies legacy birthday values into the new `age` column.
///
/// `birth_date` stays in the table as read-only legacy data; the profile and
/// patient forms now write `age` directly. Runs once on upgrade and is a no-op
/// afterwards because already-filled ages are skipped.
Future<void> backfillPatientAges(AppDatabase db) async {
  final rows = await db
      .customSelect(
        'SELECT id, birth_date FROM patients '
        'WHERE age IS NULL AND birth_date IS NOT NULL',
      )
      .get();
  if (rows.isEmpty) return;

  final now = DateTime.now();
  for (final row in rows) {
    final epoch = row.read<int?>('birth_date');
    if (epoch == null) continue;
    final birthDate = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
    await db.customUpdate(
      'UPDATE patients SET age = ? WHERE id = ?',
      variables: [
        Variable.withInt(_ageAt(birthDate, now)),
        Variable.withInt(row.read<int>('id')),
      ],
    );
  }
}

int _ageAt(DateTime birthDate, DateTime now) {
  var years = now.year - birthDate.year;
  if (now.month < birthDate.month ||
      (now.month == birthDate.month && now.day < birthDate.day)) {
    years--;
  }
  return years < 0 ? 0 : years;
}
