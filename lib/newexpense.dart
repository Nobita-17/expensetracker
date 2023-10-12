import 'package:flutter/material.dart';
import 'package:expensetracker/model/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onaddexpense});

  final void Function(Expense expense) onaddexpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  DateTime? selected; // Declare and initialize selected
  Category selectedcategory = Category.leisure;

  void dispose() {
    controller1.dispose();
    controller2.dispose();
    print('Dispose method executed');
    super.dispose();
  }

  void navigator() {
    Navigator.pop(context);
  }

  void datepicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime(now.year + 10, now.month, now.day);

    final pickdate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickdate != null) {
      setState(() {
        selected = pickdate;
      });
    }
  }

  void submitdata() {
    try {
      final amount = double.parse(controller2.text);
      final validamount = amount <= 0;

      if (controller1.text.trim().isEmpty || validamount || selected == null) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Invalid Input"),
            content: Text('Try adding different input'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
            ],
          ),
        );
        return;
      }
      widget.onaddexpense(
        Expense(
            title: controller1.text,
            amount: double.parse(controller2.text),
            date: selected!,
            category: selectedcategory),
      );
      Navigator.pop(context);
    } catch (e) {
      // Handle the parsing error here, e.g., show an error message
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Invalid Amount"),
          content: Text('Please enter a valid numeric amount.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: controller1,
            maxLength: 50,
            decoration: InputDecoration(
              labelText: "Enter Expense",
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller2,
                  keyboardType: TextInputType.number,
                  maxLength: 50,
                  decoration: InputDecoration(
                    prefix: Text("Rs"),
                    labelText: "Enter Amount",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Row(
            children: [
              DropdownButton(
                value: selectedcategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    selectedcategory = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: submitdata,
                child: const Text('Save Expense'),
              ),
              TextButton(
                onPressed: navigator,
                child: Text('Cancel'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Select Date'),
                    IconButton(
                      onPressed: datepicker,
                      icon: const Icon(Icons.date_range),
                    ),
                    Text(
                      selected == null
                          ? 'No date selected'
                          : formatted.format(selected!),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
