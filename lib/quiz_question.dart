class QuizQuestion {
  const QuizQuestion(this.text, this.answers);     // creating class for handling our question of quiz. from this we can create objects

  final String text;      // this will have question
  final List<String> answers; //will have options

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;

    }
}