import 'dart:math';

import 'package:flutter/material.dart';

class NewMaterial extends StatefulWidget {
  final Function addMt;
  NewMaterial(this.addMt);
  @override
  State<NewMaterial> createState() => _NewMaterialState();
}

class _NewMaterialState extends State<NewMaterial> {
  final titleController = TextEditingController();
  final gradeController = TextEditingController();
  final authorSchoolController = TextEditingController();
  final authorController = TextEditingController();
  // final TypeController = TextEditingController();
  final DeptController = TextEditingController();

  void submitData() {
    final enterdTitle = titleController.text;
    final enteredGrade = int.parse(gradeController.text);
    final enteredAuthor = authorController.text;
    final enteredSchool = authorSchoolController.text;
    //final enteredType = TypeController.text;
    final enteredDept = DeptController.text;

    if (enterdTitle.isEmpty ||
        enteredGrade < 0 ||
        enteredAuthor.isEmpty ||
        enteredSchool.isEmpty ||
        // enteredType.isEmpty ||
        enteredDept.isEmpty) {
      return;
    }
    widget.addMt(
      enterdTitle,
      enteredAuthor,
      enteredSchool,
      enteredGrade,
      enteredDept,
    );
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
              decoration: InputDecoration(labelText: 'school'),
              controller: authorSchoolController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'grade'),
              controller: gradeController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'author'),
              controller: authorController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Departement'),
              controller: DeptController,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              child: Text(
                'Add Material',
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
