import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final IconData icon;
  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.icon = Icons.face_unlock_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(icon, color: Colors.deepPurple),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black38,
          )),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black38,
          ))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
