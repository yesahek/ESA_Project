// ignore_for_file: public_member_api_docs, sort_constructors_first
class Question {
  final String questionId;
  final String question;
  final List? choice;
  int ?answer;
  Question({

    required this.questionId,
    required this.question,
    this.choice = null,
    this.answer = null,
  });
}
