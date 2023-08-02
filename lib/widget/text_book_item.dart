// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_sup_app/screens/pdf_view_screen.dart';
import 'package:flutter/material.dart';
// import '../utils/colors.dart';

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
      child: GestureDetector(
        onTap: () {
          //  Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (BuildContext context) => pdfPage(),
          //     ));
        },
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              child: Image(
                image: AssetImage(bookCover),
              ),
            ),
            Text(bookTitle)
          ],
        ),
      ),
    );
  }
}
