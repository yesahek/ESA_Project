import 'package:flutter/material.dart';

import '../models/question.dart';

class QuestionProvider with ChangeNotifier {
  List<Question> _questions = [];

  List<Question> get questions => _questions;

  // Add a method to fetch the list of questions 
  Future<void> fetchQuestionsForQuiz(String quizId) async {
    await Future.delayed(Duration(seconds: 2));

    _questions = [
      Question(
        id: '1',
        quizId: quizId,
        questionText: 'What is the capital of France?',
        options: ['London', 'Paris', 'Berlin', 'Rome'],
        correctOption: 1,
      ),
      Question(
        id: '2',
        quizId: quizId,
        questionText: 'What is 2 + 2?',
        options: ['1', '2', '3', '4'],
        correctOption: 3,
      ),
    ];

    notifyListeners();
  }
}
