import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
  }
}