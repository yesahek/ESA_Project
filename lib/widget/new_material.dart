// import 'dart:io';

// import 'package:e_sup_app/resources/storage_methods.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:flutter/services.dart';
// import 'package:path/path.dart' as path;
// import 'package:e_sup_app/widget/my_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_document_picker/flutter_document_picker.dart';

// class NewMaterial extends StatefulWidget {
//   final Function addMt;
//   final String sId;
//   final String uid;
//   NewMaterial(this.addMt, this.sId, this.uid);
//   @override
//   State<NewMaterial> createState() => _NewMaterialState();
// }

// class _NewMaterialState extends State<NewMaterial> {
//   final titleController = TextEditingController();
//   final gradeController = TextEditingController();
//   // final TypeController = TextEditingController();
//   final DeptController = TextEditingController();
//   File? _file;

//   Future<void> _selectPdf() async {
//     try {
//       final pathToFile = await FlutterDocumentPicker.openDocument();
//       String fName = path.basename(pathToFile!);
//       //print(fName);

//       _file = File(pathToFile);
//       if (_file == null) {
//         return null;
//       }
//       setState(() {
//         titleController.text = fName;
//       });
//       // await StorageMethods()
//       // .uploadFileToStorage("materials", "userId", file, false);
//       // firebase_storage.UploadTask? task =
//       //     await StorageMethods().uploadFileToStorage("materials", "userId", fName, file);
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   void submitData() {
//     final enterdTitle = titleController.text;
//     final enteredGrade = int.parse(gradeController.text);
//     final enteredDept = DeptController.text;

//     if (enterdTitle.isEmpty ||
//         enteredGrade < 0 ||
//         // enteredType.isEmpty ||
//         enteredDept.isEmpty) {
//       return;
//     }

//     widget.addMt(enterdTitle, enteredGrade, enteredDept, _file, widget.sId, widget.uid);
//     Navigator.of(context).pop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       child: Container(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             TextField(
//               decoration: InputDecoration(labelText: 'Title'),
//               controller: titleController,
//               onSubmitted: (_) => submitData(),
//             ),
//             // TextField(
//             //   decoration: InputDecoration(labelText: 'school'),
//             //   controller: authorSchoolController,
//             //   onSubmitted: (_) => submitData(),
//             // ),
//             TextField(
//               decoration: InputDecoration(labelText: 'grade'),
//               controller: gradeController,
//               keyboardType: TextInputType.number,
//               onSubmitted: (_) => submitData(),
//             ),
//             // TextField(
//             //   decoration: InputDecoration(labelText: 'author'),
//             //   controller: authorController,
//             //   onSubmitted: (_) => submitData(),
//             // ),
//             TextField(
//               decoration: InputDecoration(labelText: 'Departement'),
//               controller: DeptController,
//               onSubmitted: (_) => submitData(),
//             ),
//             MyButton(
//               onTap: _selectPdf,
//               content: Text("Browse PDF....."),
//             ),
//             TextButton(
//               child: Text(
//                 'Add Material',
//                 style: TextStyle(
//                   color: Colors.purple,
//                 ),
//               ),
//               onPressed: submitData,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
