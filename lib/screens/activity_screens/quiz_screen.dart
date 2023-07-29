import 'package:e_sup_app/providers/leaders.dart';
// import 'package:e_sup_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/global_variables.dart';
import '../../widget/leader_item.dart';
import '../../widget/leaderboard_item.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //physics: NeverScrollableScrollPhysics(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Text(
                  "There is no Quiz available for know",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
