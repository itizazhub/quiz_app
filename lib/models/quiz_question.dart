class QuizQuestion {
  QuizQuestion({required this.text, required this.answers});
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledAnwers = List.of(answers);
    shuffledAnwers.shuffle();
    return shuffledAnwers;
  }
}
