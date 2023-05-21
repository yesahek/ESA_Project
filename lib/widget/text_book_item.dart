// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class TextBookItem extends StatelessWidget {
  final String bookId;
  final String bookTitle;
  final String bookCover;
  const TextBookItem({
    Key? key,
    required this.bookId,
    required this.bookTitle,
    required this.bookCover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            child: Image.network(bookCover),
          ),
          Text(bookTitle)
        ],
      ),
    );
  }
}
