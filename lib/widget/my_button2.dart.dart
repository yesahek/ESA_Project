import 'package:flutter/material.dart';

class MyButton2 extends StatelessWidget {
  //final String text;
  final VoidCallback onTap;
  final String content;
  const MyButton2({
    super.key,
    required this.onTap,
     required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(content),
    );
  }
}
