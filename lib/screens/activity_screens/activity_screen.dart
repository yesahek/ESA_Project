import 'package:e_sup_app/screens/activity_screens/leaderboard_screen.dart';
import 'package:e_sup_app/screens/activity_screens/quiz_uploader.dart';
import 'package:e_sup_app/screens/activity_screens/quiz_starter_screen.dart';
import 'package:e_sup_app/widget/my_appBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/quiz_provider.dart';
import '../../providers/users_provider.dart';
import '../../utils/colors.dart';
import '../../unWanted/quiz_screen.dart';
// import '../../../utils/global_variables.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    final userDetail =
        Provider.of<UserProvider>(context, listen: false).getUser;
    final quizProvider = Provider.of<QuizProvider>(context);
    final quizzes = quizProvider.quizzes;
   
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(children: [
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
                  itemCount: quizzes.length,
                  itemBuilder: (context, index) {
                    final quiz = quizzes[index];
                    return ListTile(
                      title: Text(quiz.title),
                      onTap: () {
                        // Navigate to the selected quiz
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizStarter(
                              quiz: quiz,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
      floatingActionButtonLocation: userDetail.type != "Student"
          ? FloatingActionButtonLocation.endFloat
          : null,
      floatingActionButton: userDetail.type != "Student"
          ? FloatingActionButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => QuizUploader(),
                //   ),
                // );
              },
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.add,
              ),
            )
          : null,
    );
  }
}
