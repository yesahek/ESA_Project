// // import 'package:e_sup_app/utils/colors.dart';
// import 'package:e_sup_app/unWanted/quiz_screen2.dart';
// import 'package:flutter/material.dart';

// import '../widget/my_appBar.dart';
// import '../screens/activity_screens/quiz_starter_screen.dart';

// class Quiz extends StatefulWidget {
//   const Quiz({super.key});

//   @override
//   State<Quiz> createState() => _QuizState();
// }

// class _QuizState extends State<Quiz> {
//   @override
//   Widget build(BuildContext context) {
//     final List<String> availableQuizzes = [
//       'English quiz',
//       'Math quiz',
//       'Science quiz',
//     ];

//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 MyAppBar(
//                   backArrow: false,
//                   title: "Activity",
//                   name: "",
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                   ),
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: availableQuizzes.length,
//                     itemBuilder: (context, index) {
//                       final quizName = availableQuizzes[index];
//                       return ListTile(
//                         title: Text(quizName),
//                         onTap: () {
//                           // Navigate to the selected quiz
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => QuizStarter(),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
