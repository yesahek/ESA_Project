import 'package:flutter/material.dart';

import '../../widget/my_appBar.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(
              backArrow: true,
              title: "Friends",
              name: "",
            ),
          ],
        ),
      ),
    );
  }
}
