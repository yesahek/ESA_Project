// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:e_sup_app/providers/assignment_provider.dart';
import 'package:e_sup_app/providers/courses_provider.dart';

import 'package:path/path.dart' as path;
import 'package:e_sup_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';

import 'my_button.dart';

class AddNewAssignment extends StatefulWidget {
  final String uid;
  AddNewAssignment(
    this.uid,
  );
  @override
  State<AddNewAssignment> createState() => _AddNewAssignmentState();
}

class _AddNewAssignmentState extends State<AddNewAssignment> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool _isLoading = false;
  File? _file;

  Future<void> _selectPdf() async {
    try {
      final pathToFile = await FlutterDocumentPicker.openDocument();
      String fName = path.basename(pathToFile!);
      //print(fName);

      _file = File(pathToFile);
      if (_file == null) {
        return null;
      }
      setState(() {
        titleController.text = fName;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void submitData() async {
    final Uid = widget.uid;
    final String enterdTitle = titleController.text;
    final String enterdDescription = descriptionController.text;

    if (enterdTitle.isEmpty ) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    String forSnack = "";
    String res = await assignmentProvider().uploadAssignment(
        titleController.text, enterdDescription, 12, "courseId",Uid, _file!, DateTime.now(),);

    setState(() {
      _isLoading = false;
    });
    if (res == "success") {
      forSnack = "Assignment Added successfuly";
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
              decoration: InputDecoration(labelText: 'description'),
              controller: descriptionController,
              onSubmitted: (_) => submitData(),
            ),MyButton(
              onTap: _isLoading ? () {} : _selectPdf,
              content: _isLoading
                  ? Text("Uploading ......")
                  : Text("Browse PDF....."),
            ),
            TextButton(
              child: Text(
                'Add Assignment',
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
