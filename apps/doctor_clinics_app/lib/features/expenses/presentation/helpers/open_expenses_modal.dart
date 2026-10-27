import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/expenses/presentation/cubit/expenses_cubit.dart';

/// Opens the expense editor modal, then refreshes the expenses dashboard.
Future<void> openExpensesExpense(BuildContext context, int expenseId) async {
  await context.push<bool>('${Routes.expenses}/expenses/$expenseId');
  if (context.mounted) context.read<ExpensesCubit>().refresh();
}
