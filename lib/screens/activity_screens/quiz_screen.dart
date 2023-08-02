// import 'package:e_sup_app/utils/colors.dart';
import 'package:e_sup_app/screens/activity_screens/quiz_screen2.dart';
import 'package:flutter/material.dart';

import '../../widget/my_appBar.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    final List<String> availableQuizzes = [
      'English quiz',
      'Math quiz',
      'Science quiz',
      'History quiz'
    ];

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

    void updateQuestionStatus() {
      isFirstQuestion = questionIndex == 0;
      isLastQuestion = questionIndex == questions.length - 1;
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyAppBar(
                backArrow: false,
                title: "Activity",
                name: "",
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: availableQuizzes.length,
                  itemBuilder: (context, index) {
                    final quizName = availableQuizzes[index];
                    return ListTile(
                      title: Text(quizName),
                      onTap: () {
                        // Navigate to the selected quiz
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizeScreen(
                              isFirstQuestion: isFirstQuestion,
                              isLastQuestion: isLastQuestion,
                              question: questions[questionIndex]['question'],
                              answers: List<String>.from(
                                  questions[questionIndex]['answers']),
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
                                // show a result screen and navigate to another page
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),

                // Text(
                //   "There is no Quiz available for know",
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 20,
                //   ),
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
