import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzz/questionidentifoer.dart';

class Items extends StatelessWidget {
  const Items(this.itemdata, {super.key});

  final Map<String, Object> itemdata;

  @override
  Widget build(BuildContext context) {
    final correctanswer = itemdata['user_answer'] == itemdata['correct_answer'];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Identifier(
            iscorrectAnswer: correctanswer,
            questionIndex: itemdata['question_index'] as int,
          ),
          SizedBox(width: 20),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemdata['question'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemdata['correct_answer'] as String,
                style: GoogleFonts.roboto(
                  color: Colors.green,
                ),
              ),
              Text(
                itemdata['user_answer'] as String,
                style: GoogleFonts.roboto(
                  color: Colors.red,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
