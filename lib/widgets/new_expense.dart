import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({required this.onSave, super.key});

  final void Function(Expense) onSave;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _showDatePicker() {}

  void saveNewExpense() {
    widget.onSave(
      Expense(
        title: _titleController.text,
        amount: double.tryParse(_amountController.text)!,
        category: Category.food,
        date: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('title'),
            ),
          ),
          Row(
            children: [
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixText: '\$',
                  label: Text('amount'),
                ),
              ),
              const SizedBox(width: 15),
              Row(
                children: [
                  const Text('Date to be added'),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_month),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: saveNewExpense,
                child: const Text('save'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
