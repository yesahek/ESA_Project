// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class courseItem extends StatelessWidget {
  final String title;
  const courseItem({
    Key? key,
    required this.title,
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
      ),
    );
  }
}
