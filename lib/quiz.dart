import 'package:flutter/material.dart';
import 'package:quizzz/data/questions.dart';
import 'package:quizzz/questions_screen.dart';
import 'package:quizzz/result.dart';
import 'package:quizzz/startscreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
   List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void SwitchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseanswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers=[];
        activeScreen = 'result-screen';
      });
    }
  }

 void restartQuiz(){
    setState(() {
      selectedAnswers=[];
      activeScreen= 'result-screen';
    });
 }

  @override
  Widget build(BuildContext context) {
    Widget screenwidget = Startscreen(SwitchScreen);

    if (activeScreen == 'question-screen') {
      screenwidget =  QuestionsScreen(onSelectAnswer: chooseanswer);
    }

    if (activeScreen == 'result-screen') {
      screenwidget =  ResultsScreen(score: selectedAnswers,onrestart:restartQuiz, restartQuiz: null,);
    }



    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenwidget,
        ),
      ),
    );
  }
}
