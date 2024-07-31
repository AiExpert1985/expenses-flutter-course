import 'package:flutter/material.dart';

import 'package:expenses/widgets/expenses_list/expense_list.dart';
import 'package:expenses/models/expense.dart';
import 'package:expenses/widgets/new_expense.dart';

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

  void addNewExpense(Expense expense) {
    expenses.add(expense);
    setState(() {});
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onSave: addNewExpense),
    );
  }

  void _removeListItem(expense) {
    int itemIndex = expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Expense was deleted'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                expenses.insert(itemIndex, expense);
              });
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expenses'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('chart to be shown ...'),
          const SizedBox(height: 30),
          ExpenseList(expenses: expenses, removeListItem: _removeListItem),
        ],
      ),
    );
  }
}
