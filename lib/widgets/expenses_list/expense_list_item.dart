import 'package:flutter/material.dart';

import 'package:expenses/models/expense.dart';

class ExpenseListItem extends StatelessWidget {
  const ExpenseListItem({required this.expense, super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(expense.title),
        Row(
          children: [
            Text('\$${expense.amount.toStringAsFixed(2)}'),
            const SizedBox(width: 20),
            Text(expense.category.name),
            const SizedBox(width: 20),
            Text(expense.formattedDate),
          ],
        )
      ],
    );
  }
}
