import 'package:flutter/material.dart';

import 'package:expenses/models/expense.dart';
import 'package:expenses/widgets/expenses_list/expense_list_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    required this.expenses,
    required this.removeListItem,
    super.key,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) removeListItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) => removeListItem(expenses[index]),
          key: ValueKey(expenses[index]),
          child: ExpenseListItem(expense: expenses[index]),
        ),
      ),
    );
  }
}
