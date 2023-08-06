class Question {
  final String id;
  final String quizId;
  final String questionText;
  final List<String> options;
  final int correctOption;

  Question({
    required this.id,
    required this.quizId,
    required this.questionText,
    required this.options,
    required this.correctOption,
  });
}
