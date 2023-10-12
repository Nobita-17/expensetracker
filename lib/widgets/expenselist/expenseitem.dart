import 'package:flutter/material.dart';
import 'package:expensetracker/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem({super.key, required this.expense});

  final Expense expense;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Card(
        child: Column(
          children: [
            Text(expense.title),
            Row(
              children: [
                Text('${expense.amount.toStringAsFixed(2)}',style: TextStyle(color: Colors.green),),
                Spacer(flex: 15),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.getformatdate(expense.date),style: TextStyle(color: Colors.green),),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );

  }
}
