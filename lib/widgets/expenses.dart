import 'package:flutter/material.dart';

import 'package:expenses/widgets/expenses_list/expense_list.dart';
import 'package:expenses/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  List<Expense> expenses = [
    Expense(
        title: 'my food',
        date: DateTime.now(),
        amount: 19.2,
        category: Category.food),
    Expense(
        title: 'my work',
        date: DateTime.now(),
        amount: 9.0,
        category: Category.work),
  ];

  @override
  Widget build(Object context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('chart to be shown ...'),
          ExpenseList(expenses: expenses),
        ],
      ),
    );
  }
}
