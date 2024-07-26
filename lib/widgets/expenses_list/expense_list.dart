import 'package:flutter/material.dart';

import 'package:expenses/models/expense.dart';
import 'package:expenses/widgets/expenses_list/expense_list_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    required this.expenses,
    super.key,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => ExpenseListItem(expense: expenses[index]),
      ),
    );
  }
}
