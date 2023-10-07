import 'package:flutter/material.dart';
import 'package:quizzz/data/questions.dart';
import 'package:quizzz/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> score;

  const ResultsScreen({
    Key? key,
    required this.score,
    required this.restartQuiz, required void Function() onrestart,
  }) : super(key: key);

final void function () restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < score.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': score[i],
        },
      );
      // if(summary[score]==summary[answers])
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered ${numCorrectQuestions} out of ${questions.length} questions correctly!'),
            const SizedBox(
              height: 30,
            ),
            Summary(
                summarydata: getSummaryData()), // Pass the summary data here
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed:restartQuiz,
              child: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
