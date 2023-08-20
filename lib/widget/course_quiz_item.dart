// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/quiz.dart' as model;
import '../screens/activity_screens/quiz_starter_screen.dart';
import '../utils/colors.dart';

class courseQuizItem extends StatefulWidget {
  final model.Quiz quiz;
  final String courseName;
  courseQuizItem({
    Key? key,
    required this.quiz,
    required this.courseName,
  }) : super(key: key);

  @override
  State<courseQuizItem> createState() => _courseQuizItemState();
}

class _courseQuizItemState extends State<courseQuizItem> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    void _press() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizStarter(quiz: widget.quiz),
        ),
      );
    }

    return GestureDetector(
      onTap: _press,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        margin: EdgeInsets.only(bottom: 16),
        width: size.width - 48,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(38.5),
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(0, 10),
          //     blurRadius: 33,
          //     // color: Colors.red,
          //   ),
          //],
        ),
        child: Row(
          children: [
            Icon(
              Icons.question_mark,
              color: Colors.green,
              size: 25,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Quiz  ",
                    style: TextStyle(
                      fontSize: 16,
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " - ${widget.courseName}",
                    style: TextStyle(color: kLightBlackColor),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onPressed: _press,
            )
          ],
        ),
      ),
    );
  }
}
