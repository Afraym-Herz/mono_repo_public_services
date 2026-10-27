import 'package:drift/drift.dart';

import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';

/// Seeds the demo clinic's operating expenses and their category buckets so
/// the expenses workspace opens with content in the offline MVP.
///
/// Rows are tagged with [_createdBy], so re-running the seeder never duplicates
/// them and real expenses are never touched.
class ExpensesDemoSeeder {
  ExpensesDemoSeeder({required this.billingDao});

  final BillingDao billingDao;

  static const String _createdBy = 'demo-billing';

  Future<void> seedIfEmpty() async {
    final expenses = await billingDao.getAllExpenses();
    if (expenses.any((expense) => expense.createdBy == _createdBy)) return;

    final categories = await billingDao.getExpenseCategories();
    final categoryIds = {
      for (final category in categories) category.name: category.id,
    };
    for (final name in _categoryNames) {
      if (categoryIds.containsKey(name)) continue;
      categoryIds[name] = await billingDao.insertExpenseCategory(
        ExpenseCategoriesCompanion.insert(name: name),
      );
    }

    final now = DateTime.now();
    for (final spec in _expenseSpecs) {
      final categoryId = categoryIds[spec.category];
      if (categoryId == null) continue;
      await billingDao.insertExpense(
        ExpensesCompanion.insert(
          categoryId: categoryId,
          amount: spec.amountPiasters,
          description: Value(spec.description),
          expenseDate: now.subtract(Duration(days: spec.daysAgo)),
          createdBy: _createdBy,
        ),
      );
    }
  }

  static const List<String> _categoryNames = [
    'إيجار العيادة',
    'مستلزمات طبية',
    'رواتب وأجور',
    'كهرباء ومياه',
    'صيانة',
  ];

  static const List<_ExpenseSpec> _expenseSpecs = [
    _ExpenseSpec(
      category: 'مستلزمات طبية',
      description: 'مستلزمات تعقيم وغيارات',
      amountPiasters: 85000,
      daysAgo: 0,
    ),
    _ExpenseSpec(
      category: 'إيجار العيادة',
      description: 'إيجار الشهر الحالي',
      amountPiasters: 450000,
      daysAgo: 3,
    ),
    _ExpenseSpec(
      category: 'مستلزمات طبية',
      description: 'شراء قفازات وأقنعة',
      amountPiasters: 45000,
      daysAgo: 5,
    ),
    _ExpenseSpec(
      category: 'رواتب وأجور',
      description: 'رواتب فريق التمريض',
      amountPiasters: 600000,
      daysAgo: 7,
    ),
    _ExpenseSpec(
      category: 'كهرباء ومياه',
      description: 'فواتير المرافق',
      amountPiasters: 60000,
      daysAgo: 12,
    ),
    _ExpenseSpec(
      category: 'صيانة',
      description: 'صيانة جهاز الأشعة',
      amountPiasters: 35000,
      daysAgo: 20,
    ),
  ];
}

class _ExpenseSpec {
  const _ExpenseSpec({
    required this.category,
    required this.description,
    required this.amountPiasters,
    required this.daysAgo,
  });

  final String category;
  final String description;
  final int amountPiasters;
  final int daysAgo;
}
