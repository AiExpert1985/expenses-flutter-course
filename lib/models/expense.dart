import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

const uuid = Uuid();

final dateFormater = DateFormat.yMd();

enum Category { travel, food, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.date,
    required this.amount,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final Category category;

  String get formattedDate {
    return dateFormater.format(date);
  }
}
