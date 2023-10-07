import 'package:flutter/material.dart';
import 'package:quizzz/summary_items.dart';

class Summary extends StatelessWidget {

  Summary({required this.summarydata, Key? key}) : super(key: key);

  List<Map<String, Object>> summarydata =[];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map(
                (data) {
                  return Items(data);
                },
          ).toList(),   // coverts map data structure into list
        ),
      ),
    );
  }
}
