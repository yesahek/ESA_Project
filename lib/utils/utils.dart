import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';

// file picking up from user storage
// pickFile( MediaSource source) async{
//   final pathToFile = await FlutterDocumentPicker.openDocument();
//   XFile? file = await
// }

// displaying snackbas
showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}
