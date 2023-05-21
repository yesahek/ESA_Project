import 'package:flutter/material.dart';

import '../utils/colors.dart';

class LeaderBoardItem extends StatelessWidget {
  const LeaderBoardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: appColor,
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.leaderboard_outlined,
          size: 50,
        ),
      ),
    );
  }
}
