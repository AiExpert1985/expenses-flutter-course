import 'package:expenses/models/expense.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final dateFormater = DateFormat.yMd();

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
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    DateTime currentDate = DateTime.now();
    final selected_date = await showDatePicker(
      context: context,
      firstDate:
          DateTime(currentDate.year - 1, currentDate.month, currentDate.day),
      lastDate:
          DateTime(currentDate.year + 1, currentDate.month, currentDate.day),
    );
    setState(() {
      _selectedDate = selected_date;
    });
  }

  void saveNewExpense() {
    widget.onSave(
      Expense(
        title: _titleController.text,
        amount: double.tryParse(_amountController.text)!,
        category: Category.food,
        date: _selectedDate!,
      ),
    );
    dispose();
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
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text('amount'),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "No date selected"
                          : dateFormater.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _showDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
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
