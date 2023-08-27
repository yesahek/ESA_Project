// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:e_sup_app/providers/lesson_provider.dart';
import 'package:e_sup_app/utils/utils.dart';
import '../../widget/my_button2.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

import '../../models/lesson.dart' as Les;
import '../../models/user.dart' as model;
import '../../providers/users_provider.dart';
import '../../widget/my_appBar.dart';

class LessonWrite extends StatefulWidget {
  final int grade;
  final String autherId;
  final String courseId;
  const LessonWrite({
    Key? key,
    required this.grade,
    required this.autherId,
    required this.courseId,
  });
  @override
  State<LessonWrite> createState() => _LessonWriteState();
}

QuillController _controller = QuillController.basic();

class _LessonWriteState extends State<LessonWrite> {
  TextEditingController _titleController = TextEditingController();
  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TextFormField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: "lesson 1",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'enter a title eg: lesson 1';
              }
              return null;
            },
            maxLines: 1,
          ),
          actions: [
            MyButton2(
              content: "Ok",
              onTap: () {
                Navigator.of(context).pop();
                _save();
              },
            ),
          ],
        );
      },
    );
  }

  void _save() async {
    // Get the content from the QuillController
    //final String content = _controller.document.toPlainText();
    final String contentJson =
        jsonEncode(_controller.document.toDelta().toJson());
    Les.lesson lesson = Les.lesson(
      title: _titleController.text,
      grade: widget.grade,
      authorId: widget.autherId,
      courseId: widget.courseId,
      content: contentJson,
    );

    lessonProvider().uploadLesson(lesson);
    print('Content saved successfully');
    showSnackBar(context, "Lesson upload successfully");
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    model.User userDetail =
        Provider.of<UserProvider>(context, listen: false).getUser;
    bool isEducator = userDetail.type == "Educator";
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(backArrow: true, name: "", title: "lesson"),
            Padding(
              padding: const EdgeInsets.only(top: 38),
              child: QuillToolbar.basic(controller: _controller),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.lightBlueAccent,
                        offset: Offset(5, 5),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                      BoxShadow(color: Colors.white),
                    ],
                  ),
                  child: QuillEditor.basic(
                    controller: _controller,
                    readOnly: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check), onPressed: _showAlertDialog),
    );
  }
}
