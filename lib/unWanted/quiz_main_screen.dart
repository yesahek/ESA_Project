// import 'package:e_sup_app/widget/my_appBar.dart';
// import 'package:flutter/material.dart';

// import 'quiz_screen2.dart';

// class QuizMainScreen extends StatefulWidget {
//   const QuizMainScreen({super.key});

//   @override
//   State<QuizMainScreen> createState() => _QuizMainScreenState();
// }

// class _QuizMainScreenState extends State<QuizMainScreen> {
//   @override
//     final List<String> availableQuizzes = [
//       'English quiz',
//       'Math quiz',
//       'Science quiz',
//       'History quiz'
//     ];

//     int questionIndex = 0;
//     List<Map<String, dynamic>> questions = [
//       {
//         'question': 'What is 2 + 2?',
//         'answers': ['3', '4', '5', '6'],
//         'correctAnswer': '4',
//       },
//       {
//         'question': 'What is the capital of France?',
//         'answers': ['London', 'Berlin', 'Paris', 'Madrid'],
//         'correctAnswer': 'Paris',
//       },
//       // Add more questions here
//     ];
//     String selectedAnswer = '';
//     bool isFirstQuestion = true;
//     bool isLastQuestion = false;



//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             MyAppBar(backArrow: false, title: 'Quiz Main Screen', name: ''),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black),
//               ),
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: availableQuizzes.length,
//                 itemBuilder: (context, index) {
//                   final quizName = availableQuizzes[index];
//                   return ListTile(
//                     title: Text(quizName),
//                     onTap: () {
//                       // Navigate to the selected quiz
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => QuizScreen(
//                             isFirstQuestion: isFirstQuestion,
//                             isLastQuestion: isLastQuestion,
//                             question: questions[questionIndex]['question'],
//                             answers: List<String>.from(
//                                 questions[questionIndex]['answers']),
//                             selectedAnswer: selectedAnswer,
//                             onAnswerSelected: (answer) {
//                               setState(() {
//                                 selectedAnswer = answer;
//                               });
//                             },
//                             onPrevQuestion: () {
//                               setState(() {
//                                 questionIndex--;
//                                 selectedAnswer = '';
//                                 updateQuestionStatus();
//                               });
//                             },
//                             onNextQuestion: () {
//                               setState(() {
//                                 questionIndex++;
//                                 selectedAnswer = '';
//                                 updateQuestionStatus();
//                               });
//                             },
//                             onComplete: () {
//                               // Handle quiz completion
//                               // show a result screen and navigate to another page
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//     void updateQuestionStatus() {
//       isFirstQuestion = questionIndex == 0;
//       isLastQuestion = questionIndex == questions.length - 1;
//     }
// }
