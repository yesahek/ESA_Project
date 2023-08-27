// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../screens/lesson_reading_screen.dart';
import '../utils/colors.dart';

class courseLessonItem extends StatefulWidget {
  final String materialId;
  final String content;
  final String title;
  final String courseId;
  final String courseName;
  const courseLessonItem({
    Key? key,
    required this.materialId,
    required this.content,
    required this.title,
    required this.courseId,
    required this.courseName,
  }) : super(key: key);

  @override
  State<courseLessonItem> createState() => _courseLessonItemState();
}

class _courseLessonItemState extends State<courseLessonItem> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    void _press() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LessonReadingPage(
                  title: widget.title,
                  content: widget.content,
                )),
      );
    }
    return GestureDetector(
      onTap: _press,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        margin: EdgeInsets.only(bottom: 16),
        width: size.width - 48,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(38.5),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 33,
              color: Color(0xFFD3D3D3).withOpacity(.84),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.library_books,
              color: Colors.grey,
              size: 25,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: " - ${widget.title}",
                    style: TextStyle(
                      fontSize: 16,
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    //text: "    ${widget.courseName}",
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
