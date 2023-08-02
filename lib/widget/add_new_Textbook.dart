// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:e_sup_app/providers/text_books.dart';
import 'package:e_sup_app/utils/utils.dart';
import 'package:e_sup_app/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:path/path.dart' as path;

class AddNewTextBook extends StatefulWidget {
  final int grade;
  AddNewTextBook(
    this.grade,
  );
  @override
  State<AddNewTextBook> createState() => _AddNewTextBookState();
}

class _AddNewTextBookState extends State<AddNewTextBook> {
  final titleController = TextEditingController();
  final BookController = TextEditingController();
  final GradeController = TextEditingController();
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
    final enterdTitle = titleController.text;
    final enterdGrade = GradeController.text;

    if (enterdTitle.isEmpty) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    String forSnack = "";
    String res =
        await TextBooks().uploadTextBook(enterdTitle, enterdGrade, _file!);

    setState(() {
      _isLoading = false;
    });
    if (res == "success") {
      forSnack = "file uploaded successfuly";
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
            MyButton(
              onTap: _isLoading ? () {} : _selectPdf,
              content: _isLoading
                  ? Text("Uploading ......")
                  : Text("Browse PDF....."),
            ),
            TextButton(
              child: Text(
                'Add TextBook',
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
