import 'package:e_sup_app/models/user.dart';
import 'package:e_sup_app/providers/users_provider.dart';
import 'package:e_sup_app/screens/waiting_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/global_variables.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout({
    super.key,
    required this.webScreenLayout,
    required this.mobileScreenLayout,
  });

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  late UserProvider userProvider;
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    User userDetaile = userProvider.getUser;
    bool isApprovedUser = userDetaile.status;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return widget.webScreenLayout;
        } else {
          return isApprovedUser
              ? widget.mobileScreenLayout
              : waitingScreen(
                  name: userDetaile.firstname, school: userDetaile.school);
        }
      },
    );
  }
}
