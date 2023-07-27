// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class courseMaterialItem extends StatelessWidget {
  final String materialId;
  final String fileUrl;
  final DateTime date;
  final String title;
  final String author;
  final String courseId;
  final int gr;
  final String fileType;
  const courseMaterialItem({
    Key? key,
    required this.materialId,
    required this.fileUrl,
    required this.date,
    required this.title,
    required this.author,
    required this.courseId,
    required this.gr,
    required this.fileType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: blueColor,
      //margin: EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: appColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        textColor: Colors.white,
        title: Text(title),
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          height: 40,
          width: 40,
          child: Icon(Icons.menu_book_rounded, color: Colors.white),
        ),
        subtitle: Text(courseId),
      ),
    );
  }
}
