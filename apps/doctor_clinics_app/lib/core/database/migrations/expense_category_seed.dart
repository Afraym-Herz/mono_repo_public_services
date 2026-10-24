part of '../app_database.dart';

/// Default expense buckets inserted on first launch so the expense form is
/// usable before any custom category exists.
const List<String> _defaultExpenseCategories = [
  'Equipment & tools',
  'Medical supplies',
  'Rent',
  'Salaries',
  'Utilities',
  'Maintenance',
  'Other',
];

Future<void> seedDefaultExpenseCategories(AppDatabase db) async {
  final existing = await db.select(db.expenseCategories).get();
  if (existing.isNotEmpty) return;
  for (final name in _defaultExpenseCategories) {
    await db
        .into(db.expenseCategories)
        .insert(ExpenseCategoriesCompanion.insert(name: name));
  }
}
