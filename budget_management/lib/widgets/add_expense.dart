import 'package:budget_management/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  final _inputTitleController = TextEditingController();
  final _inputExpenseController = TextEditingController();
  Category _selectedCategory = Category.vacation;
  DateTime? _selectedDate;

  void _inputDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = selectedDate;
    });
  }

  void _submitExpense() {
    final enteredAmount = double.tryParse(_inputExpenseController.text);
    final isAmountInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_inputTitleController.text.trim().isEmpty ||
        isAmountInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Invalid Input',
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 21, 71, 82),
                fontWeight: FontWeight.bold),
          ),
          content: Text(
            'No fields should be empty',
            style: GoogleFonts.lato(fontWeight: FontWeight.w400),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text(
                'Okay',
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 21, 71, 82),
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(Expense(
        title: _inputTitleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory));

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _inputTitleController.dispose();
    _inputExpenseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _inputTitleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text(
                'Title',
                style: GoogleFonts.actor(fontWeight: FontWeight.normal),
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: _inputExpenseController,
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixText: '€ ',
                  label: Text(
                    'Expense',
                    style: GoogleFonts.actor(fontWeight: FontWeight.normal),
                  ),
                ),
              )),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No date selected'
                        : formatter.format(_selectedDate!),
                    style: GoogleFonts.actor(fontWeight: FontWeight.normal),
                  ),
                  IconButton(
                      onPressed: _inputDatePicker,
                      icon: const Icon(Icons.calendar_month_rounded))
                ],
              ))
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                          style: GoogleFonts.actor(fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 21, 71, 82),
                      fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: _submitExpense,
                child: Text(
                  'Save',
                  style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 21, 71, 82),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
