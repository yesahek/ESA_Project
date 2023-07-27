import 'dart:io';

import 'package:e_sup_app/providers/course_materials_provider.dart';
import 'package:e_sup_app/resources/firestore_methods.dart';
import 'package:e_sup_app/utils/utils.dart';
import 'package:path/path.dart' as path;
import 'package:e_sup_app/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';

class AddNewMaterial extends StatefulWidget {
  final String sId;
  final String uid;
  final String courseId;
  final int grade;
  AddNewMaterial(this.sId, this.uid, this.courseId, this.grade);
  @override
  State<AddNewMaterial> createState() => _AddNewMaterialState();
}

class _AddNewMaterialState extends State<AddNewMaterial> {
  final titleController = TextEditingController();
  final CourseController = TextEditingController();
  final DescController = TextEditingController();
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

    final CourseId = widget.courseId;
    final description = DescController.text;

    if (enterdTitle.isEmpty || CourseId.isEmpty) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    String forSnack = "";
    String res = await courseMaterialProvider().uploadCourseMaterial(
        enterdTitle, description, widget.grade, CourseId, widget.uid, _file!);
        
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
            // TextField(
            //   decoration: InputDecoration(labelText: 'grade'),
            //   controller: gradeController,
            //   keyboardType: TextInputType.number,
            //   onSubmitted: (_) => submitData(),
            // ),
            // TextField(
            //   decoration: InputDecoration(labelText: widget.courseId),
            //   controller: CourseController,

            //   onSubmitted: (_) => submitData(),
            // ),
            TextField(
              decoration: InputDecoration(labelText: 'Description'),
              controller: DescController,
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
