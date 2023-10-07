import 'package:flutter/material.dart';

class Answerbutton extends StatelessWidget {
  Answerbutton({
    Key? key,
    required this.answerText,
    required this.onTap,
  }) : super(key: key);

  final String answerText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.yellow,
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ) ,
      child: Text(answerText),
    );
  }
}
