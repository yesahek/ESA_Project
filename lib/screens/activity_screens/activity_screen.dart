import 'package:e_sup_app/screens/activity_screens/quiz_screen2.dart';
import 'package:e_sup_app/widget/my_appBar.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
// import '../../../utils/global_variables.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with TickerProviderStateMixin {
  // Dummy data representing available quizzes (replace this with actual data)
  final List<Map<String, String>> availableQuizzes = [
    {
      'title': 'English Quiz',
      'description': 'Test your knowledge of English language',
    },
    {
      'title': 'Math Quiz',
      'description': 'Test your mathematical skills',
    },
    // Add more quiz items as needed
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

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
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
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: appColor,
                    ),
                  ),
                ),
                child: TabBar(
                  padding: EdgeInsets.all(10),
                  controller: _tabController,
                  labelColor: appColor,
                  indicator: BoxDecoration(
                    color: Color.fromARGB(136, 255, 193, 7),
                  ),
                  tabs: [
                    Tab(
                      text: "Quizs",
                      icon: Icon(Icons.leaderboard_outlined),
                    ),
                    Tab(
                      text: "Results",
                      icon: Icon(Icons.question_mark),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: availableQuizzes.length,
                      itemBuilder: (context, index) {
                        final quiz = availableQuizzes[index];
                        return QuizItem(
                          title: quiz['title']!,
                          description: quiz['description']!,
                          onTap: () {
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
                              },
                            ),

                              ),
                            );
                          },
                        );
                      },
                    ),
                    // Add the ResultsScreen widget here
                    ResultsScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Results will be displayed here',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class QuizItem extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const QuizItem({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: ListTile(
          title: Text(title),
          subtitle: Text(description),
          trailing: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
