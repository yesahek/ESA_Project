class Quiz {
  final String title;
  final List<Question> questions;

  Quiz({required this.title, required this.questions});
}

class Question {
  final String questionText;
  final List<Answer> answers;

  Question({required this.questionText, required this.answers});
}

class Answer {
  final String text;
  final int score;

  Answer({required this.text, required this.score});
}
