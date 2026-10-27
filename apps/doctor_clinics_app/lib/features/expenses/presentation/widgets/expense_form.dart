import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/core/helpers/money_input.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense_category.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/cubit/expense_form_cubit.dart';

import 'expense_category_field.dart';
import 'expense_fields.dart';
import 'expense_footer.dart';

/// Expense editor body: prefilled inputs and update action.
class ExpenseForm extends StatefulWidget {
  const ExpenseForm({
    super.key,
    required this.expense,
    required this.categories,
    required this.saving,
  });

  final Expense expense;
  final List<ExpenseCategoryEntity> categories;
  final bool saving;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _formKey = GlobalKey<FormState>();
  late final _amount = TextEditingController(
    text: MoneyInput.poundsText(widget.expense.amountPiasters),
  );
  late final _description = TextEditingController(
    text: widget.expense.description,
  );
  late final _notes = TextEditingController(text: widget.expense.notes ?? '');
  late final _date = ValueNotifier<DateTime>(widget.expense.expenseDate);
  late final _category = ValueNotifier<int?>(_initialCategory());

  int? _initialCategory() {
    final id = int.tryParse(widget.expense.category);
    if (id != null) return id;
    return widget.categories.isEmpty ? null : widget.categories.first.id;
  }

  @override
  void dispose() {
    _amount.dispose();
    _description.dispose();
    _notes.dispose();
    _date.dispose();
    _category.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.r),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ExpenseCategoryEntityField(
                    categories: widget.categories,
                    category: _category,
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                  ExpenseFields(
                    amount: _amount,
                    description: _description,
                    notes: _notes,
                    date: _date,
                  ),
                ],
              ),
            ),
          ),
        ),
        ExpenseFooter(
          saving: widget.saving,
          onCancel: () => context.pop(false),
          onSave: _save,
        ),
      ],
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final categoryId = _category.value;
    if (categoryId == null) return;
    final notes = _notes.text.trim();
    await context.read<ExpenseFormCubit>().save(
      categoryId: categoryId,
      amountPiasters: MoneyInput.tryParsePiasters(_amount.text) ?? 0,
      date: _date.value,
      description: _description.text.trim(),
      notes: notes.isEmpty ? null : notes,
    );
  }
}
