import 'package:expensetracker/widgets/expenselist/expense_list..dart';
import 'package:flutter/material.dart';

import '../model/expense.dart';
import '../newexpense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerexpense = [
    Expense(
        title: 'work',
        amount: 200,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Food',
        amount: 600,
        date: DateTime.now(),
        category: Category.food),
  ];

  void modelsheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onaddexpense: onaddexpense));
  }

  void onaddexpense(Expense expense) {
    setState(() {
      _registerexpense.add(expense);
    });
  }

  void removeexpense(Expense expense){
    int index = _registerexpense.indexOf(expense);
    if (index != -1) {
      setState(() {
        _registerexpense.removeAt(index);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 4),
          content: Text('Item Deleted'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                // If you want to undo the removal, insert the item back at its original index.
                _registerexpense.insert(index, expense);
              });
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );
    if (_registerexpense.isNotEmpty) {
      mainContent =
          ExpenseList(expenses: _registerexpense, removeexpense: removeexpense);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(onPressed: modelsheet, icon: Icon(Icons.add)),
        ],
        backgroundColor: Colors.deepPurple[100],
      ),
      body: Column(
        children: [
          Text('The chart '),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
