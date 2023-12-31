import 'package:budget_management/widgets/add_expense.dart';
import 'package:budget_management/widgets/chart/chart.dart';
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
      title: 'Laptop',
      amount: 110.00,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Transportation',
      amount: 23.00,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Fish and Chips',
      amount: 12.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Ibiza',
      amount: 200.00,
      date: DateTime.now(),
      category: Category.vacation,
    ),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _expeneseList.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _expeneseList.indexOf(expense);
    setState(() {
      _expeneseList.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Item Removed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expeneseList.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverLay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No items are present in the expense list'),
    );

    if (_expeneseList.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _expeneseList,
        onRemove: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Budget Manager',
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
          Chart(expenses: _expeneseList),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
