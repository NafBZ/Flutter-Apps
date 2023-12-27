import 'package:budget_management/widgets/add_expense.dart';
import 'package:budget_management/widgets/expenses_list/expenses_list.dart';
import 'package:budget_management/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> _expeneseList = [
    Expense(
      title: 'Office Materials',
      amount: 500.00,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Spain Visit',
      amount: 200.00,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Paella',
      amount: 50.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Go to Bangladesh',
      amount: 800.00,
      date: DateTime.now(),
      category: Category.vacation,
    ),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _expeneseList.add(expense);
    });
  }

  void _openAddExpenseOverLay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Budget Manager',
          style: TextStyle(color: Color.fromARGB(255, 23, 107, 135)),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverLay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Expenses Chart'),
          Expanded(
            child: ExpensesList(expenses: _expeneseList),
          )
        ],
      ),
    );
  }
}
