import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final IconData icon;
   MyTextField(
    {
    required this.hintText,
    required this.maxLines,
    required this.controller, 
    this.icon = Icons.search_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(icon),
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
            return 'Search your $hintText';
          }
          return null;
        },
        maxLines: maxLines,
      ),
    );
  }
}
