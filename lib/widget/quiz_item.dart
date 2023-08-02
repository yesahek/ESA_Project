

import 'package:flutter/material.dart';

class QuizItem extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const QuizItem({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: ListTile(
          title: Text(title),
          subtitle: Text(description),
          trailing: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
