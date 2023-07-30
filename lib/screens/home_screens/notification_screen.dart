import 'package:e_sup_app/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widget/my_appBar.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    var isAdmin = userProvider.getUser.type == "Admin";
    var isStudent = userProvider.getUser.type == "Student";
    var isEducator = userProvider.getUser.type == "Educator";
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(
              backArrow: true,
              title: "Notifications",
              name: "",
            ),
          ],
        ),
      ),
    );
  }
}
