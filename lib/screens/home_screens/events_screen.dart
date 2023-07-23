import 'package:flutter/material.dart';

import '../../widget/my_appBar.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(
              backArrow: true,
              title: "Events",
              name: "",
            ),
          ],
        ),
      ),
    );
  }
}
