// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:e_sup_app/providers/courses_provider.dart';
import 'package:e_sup_app/utils/utils.dart';
import 'package:flutter/material.dart';

class AddNewCourse extends StatefulWidget {
  final String schoolId;
  final String uid;
  AddNewCourse(
    this.schoolId,
    this.uid,
  );
  @override
  State<AddNewCourse> createState() => _AddNewCourseState();
}

class _AddNewCourseState extends State<AddNewCourse> {
  final titleController = TextEditingController();
  final GradeController = TextEditingController();

  void submitData() async {
    final Uid = widget.uid;
    final SchoolId = widget.schoolId;
    final enterdTitle = titleController.text;
    final int enterdGrade = int.parse(GradeController.text);

    if (enterdTitle.isEmpty || enterdGrade.isNaN) {
      return;
    }
    setState(() {
    });
    String forSnack = "";
    String res = await CoursesProvider()
        .addCourse(enterdTitle, enterdGrade, SchoolId, Uid);

    setState(() {
    });
    if (res == "success") {
      forSnack = "Course Added successfuly";
    } else {
      forSnack = "something wrong";
    }
    showSnackBar(context, forSnack);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Grade'),
              controller: GradeController,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              child: Text(
                'Add Course',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
