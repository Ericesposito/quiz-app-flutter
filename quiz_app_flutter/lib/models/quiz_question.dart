class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // copy our original List
    final shuffledList = List.of(answers);

    // shuffle our copy
    shuffledList.shuffle();

    // return our shuffled copy
    return shuffledList;
  }
}
