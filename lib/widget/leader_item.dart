// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class leaderItem extends StatelessWidget {
  final String name;
  final String schoolName;
  final int score;
  final int index;
  const leaderItem({
    Key? key,
    required this.name,
    required this.schoolName,
    required this.score,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        ListTile(
          title: Text(
            name,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Container(
            margin: EdgeInsets.all(02),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              //color: Colors.orange,
              // shape: BoxShape.circle,
              border: Border.symmetric(
                vertical: BorderSide(
                  color: Colors.black,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(26, 105, 103, 103),
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Center(
              child: Text(
                "$index ",
                style: TextStyle(
                  color: appColor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          subtitle: Text("From $schoolName School"),
          trailing: Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              //color: appColor,
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
            ),
            child: Text(
              "$score XP",
              style: TextStyle(
                color: appColor,
                fontSize: 10,
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.orange,
        ),
      
      ],
    );
  }
}
