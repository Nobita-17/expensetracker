import 'package:flutter/material.dart';

class Startscreen extends StatelessWidget {
  const Startscreen( this.startQuiz,{Key? key});   //here we are passing arugment as a function

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Welcome to Flutter Quiz',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          SizedBox(width: 20, height: 20),
          Image.asset(
            'quiz-logo.png',
            width: 130,
            height: 130,
            color: Colors.white.withOpacity(0.5),
          ),
          const SizedBox(width: 20, height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: Icon(Icons.arrow_forward_outlined),
            label: Text('Start QUiz'),
          ),
        ],
      ),
    );
  }
}
