import 'package:flutter/material.dart';

import '../../widget/my_appBar.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(
              backArrow: true,
              title: "Messages",
              name: "",
            ),
          ],
        ),
      ),
    );
  }
}
