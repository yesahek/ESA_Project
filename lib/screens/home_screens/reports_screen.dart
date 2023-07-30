import 'package:flutter/material.dart';

import '../../widget/my_appBar.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(
              backArrow: true,
              title: "Report",
              name: "",
            ),
          ],
        ),
      ),
    );
  }
}
