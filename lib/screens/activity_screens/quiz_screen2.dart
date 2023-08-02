import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class QuizScreenExample extends StatefulWidget {
  @override
  _QuizScreenExampleState createState() => _QuizScreenExampleState();
}

class _QuizScreenExampleState extends State<QuizScreenExample> {
  int questionIndex = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is 2 + 2?',
      'answers': ['3', '4', '5', '6'],
      'correctAnswer': '4',
    },
    {
      'question': 'What is the capital of France?',
      'answers': ['London', 'Berlin', 'Paris', 'Madrid'],
      'correctAnswer': 'Paris',
    },
    // Add more questions here
  ];
  String selectedAnswer = '';
  bool isFirstQuestion = true;
  bool isLastQuestion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Example'),
      ),
      body: QuizeScreen(
        isFirstQuestion: isFirstQuestion,
        isLastQuestion: isLastQuestion,
        question: questions[questionIndex]['question'],
        answers: List<String>.from(questions[questionIndex]['answers']),
        selectedAnswer: selectedAnswer,
        onAnswerSelected: (answer) {
          setState(() {
            selectedAnswer = answer;
          });
        },
        onPrevQuestion: () {
          setState(() {
            questionIndex--;
            selectedAnswer = '';
            updateQuestionStatus();
          });
        },
        onNextQuestion: () {
          setState(() {
            questionIndex++;
            selectedAnswer = '';
            updateQuestionStatus();
          });
        },
        onComplete: () {
          // Handle quiz completion
          // You can show a result screen or navigate to another page
        },
      ),
    );
  }

  void updateQuestionStatus() {
    isFirstQuestion = questionIndex == 0;
    isLastQuestion = questionIndex == questions.length - 1;
  }
}

class QuizeScreen extends StatelessWidget {
  final bool isFirstQuestion;
  final bool isLastQuestion;
  final String question;
  final List<String> answers;
  final String selectedAnswer;
  final ValueChanged<String> onAnswerSelected;
  final VoidCallback onPrevQuestion;
  final VoidCallback onNextQuestion;
  final VoidCallback onComplete;

  QuizeScreen({
    required this.isFirstQuestion,
    required this.isLastQuestion,
    required this.question,
    required this.answers,
    required this.selectedAnswer,
    required this.onAnswerSelected,
    required this.onPrevQuestion,
    required this.onNextQuestion,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        // Customize the AppBar as needed
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: answers.map((answer) {
                bool isSelected = answer == selectedAnswer;
                return ElevatedButton(
                  onPressed: () => onAnswerSelected(answer),
                  style: ElevatedButton.styleFrom(
                    primary: isSelected ? Colors.green : Colors.grey,
                  ),
                  child: Text(answer),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!isFirstQuestion)
              IconButton(
                onPressed: onPrevQuestion,
                icon: Icon(Icons.arrow_back_ios),
              ),
            if (isLastQuestion)
              ElevatedButton(
                onPressed: onComplete,
                child: Text('Complete'),
              ),
            if (!isLastQuestion)
              ElevatedButton(
                onPressed: onNextQuestion,
                child: Text('Next'),
              ),
          ],
        ),
      ),
    );
  }
}
