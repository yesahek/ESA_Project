import 'package:flutter/material.dart';

import '../models/quiz.dart';

class QuizProvider with ChangeNotifier {
  List<Quiz> _quizzes = [];

  List<Quiz> get quizzes => _quizzes;

  Future<void> fetchQuizzes() async {
 await Future.delayed(Duration(seconds: 2));   
    _quizzes = [
      Quiz(
        id: '1',
        title: 'English Quiz',
        description: 'Test your English knowledge!',
      ),
      Quiz(
        id: '2',
        title: 'Math Quiz',
        description: 'Test your Math skills!',
      ),
    ];
    notifyListeners();
  }
}
