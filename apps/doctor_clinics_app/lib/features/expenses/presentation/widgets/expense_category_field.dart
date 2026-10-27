import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/expenses/domain/entities/expense_category.dart';

/// Expense category selector with a fallback for unknown categories.
class ExpenseCategoryEntityField extends StatelessWidget {
  const ExpenseCategoryEntityField({
    super.key,
    required this.categories,
    required this.category,
  });

  final List<ExpenseCategoryEntity> categories;
  final ValueNotifier<int?> category;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int?>(
      valueListenable: category,
      builder: (context, value, _) => AppDropdownField<int>(
        label: 'billing.expense_form.category'.tr(),
        prefixIcon: Icons.category_outlined,
        value: value,
        items: _items(value),
        validator: (selected) => selected == null
            ? 'billing.expense_form.category_required'.tr()
            : null,
        onChanged: (selected) => category.value = selected,
      ),
    );
  }

  List<DropdownMenuItem<int>> _items(int? selected) {
    final items = [
      for (final item in categories)
        DropdownMenuItem(value: item.id, child: Text(item.name)),
    ];
    if (selected != null && !categories.any((item) => item.id == selected)) {
      items.insert(
        0,
        DropdownMenuItem(
          value: selected,
          child: Text('billing.expense.uncategorized'.tr()),
        ),
      );
    }
    return items;
  }
}
