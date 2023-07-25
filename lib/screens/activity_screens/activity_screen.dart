import 'package:e_sup_app/screens/activity_screens/leaderboard_screen.dart';
import 'package:e_sup_app/widget/my_appBar.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
// import '../../../utils/global_variables.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabContoller = TabController(length: 2, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyAppBar(
                backArrow: false,
                title: "Activity",
                name: "",
              ),
              Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: appColor,
                    ),
                  ),
                ),
                child: TabBar(
                  padding: EdgeInsets.all(10),
                  controller: _tabContoller,
                  labelColor: appColor,
                  indicator: BoxDecoration(
                    color: Color.fromARGB(136, 255, 193, 7),
                  ),
                  tabs: [
                    Tab(
                      text: "LeadBoard",
                      icon: Icon(Icons.leaderboard_outlined),
                      //iconMargin: EdgeInsets.all(5),
                      //height: 10,
                    ),
                    Tab(
                      text: "Challenge",
                      icon: Icon(Icons.question_mark),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: TabBarView(
                  controller: _tabContoller,
                  children: [
                    LeaderBoard(),
                    Icon(Icons.directions_transit),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
