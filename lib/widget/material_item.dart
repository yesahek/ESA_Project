import 'package:flutter/material.dart';

import '../utils/colors.dart';

class courseMaterialItem extends StatelessWidget {
  final String title;
  final String author;
  final String courseId;
  final int gr;
  final String fileType;
  const courseMaterialItem({
    super.key,
    required this.title,
    required this.author,
    required this.courseId,
    required this.gr,
    required this.fileType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: blueColor,
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
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: Text(
              fileType,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        subtitle: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "authorSchool",
                ),
                Text(" Gr $gr"),
              ],
            ),
            Row(
              children: [
                Text('Dept of $courseId'),
                Text('by $author'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
