import 'package:expensetracker/widgets/expenselist/expenseitem.dart';
import 'package:flutter/material.dart';
import '../../model/expense.dart';

class ExpenseList extends StatelessWidget {

  ExpenseList({super.key, required this.expenses,required this.removeexpense}); // Use a different name (expenses) for clarity
  final  Function(Expense expense) removeexpense;
  final List<Expense> expenses; // Use a different name (expenses) for clarity

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (direction){
          removeexpense(expenses[index]);
        },
          key: ValueKey(expenses[index]),
          child: ExpenseItem(expense: expenses[index]),),
    );
  }
}
