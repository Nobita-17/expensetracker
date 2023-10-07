import 'package:flutter/material.dart';
import 'package:quizzz/answerbutton.dart';
import 'package:quizzz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  var currrentQuestionIndex = 0;
  Widget build(BuildContext context) {
    final currentQuestion = questions[currrentQuestionIndex];

    void answerquestion(String selectedAnswer) {
      widget.onSelectAnswer(selectedAnswer);
      setState(() {
        currrentQuestionIndex++;
      });
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 28,
              ),
            ),

            SizedBox(height: 50),
            // SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return Column(
                  children: [
                    SizedBox(
                        height: 50,
                        width: 250,
                        child: Answerbutton(
                          answerText: answer,
                          onTap: (){
                            answerquestion(answer);
                          },
                        )),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
