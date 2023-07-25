import 'package:e_sup_app/providers/leaders.dart';
// import 'package:e_sup_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/global_variables.dart';
import '../../widget/leader_item.dart';
import '../../widget/leaderboard_item.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final leadersData = Provider.of<Leaders>(context, listen: false);
    return SingleChildScrollView(
      //physics: NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              //padding: EdgeInsets.symmetric(horizontal: 20),
              height: 150,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: ((context, i) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          LeaderBoardItem(),
                          Text(
                            leaders[i]['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            //leaders student list
            Container(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: leadersData.items.length,
                itemBuilder: (context, index) => leaderItem(
                  name: leadersData.items[index].userName,
                  schoolName: leadersData.items[index].school,
                  score: leadersData.items[index].score,
                  index: index + 3,
                ),
              ),
            ),
            Divider(
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
