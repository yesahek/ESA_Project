// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_sup_app/models/user.dart';
import 'package:e_sup_app/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/login_screen.dart';

class MyAppBar extends StatelessWidget {
  final bool backArrow;
  final String title;
  final String name;
  const MyAppBar({
    Key? key,
    required this.backArrow,
    required this.title,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User userDetaile =
        Provider.of<UserProvider>(context, listen: false).getUser;
    return Padding(
      //padding: const EdgeInsets.only(left: 4.0, right: 8.0, top: 5, bottom: 8),
      padding: const EdgeInsets.all(3),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                backArrow
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                      )
                    : Container(
                        child: Column(
                          children: [
                            Text(
                              userDetaile.firstname,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              userDetaile.type,
                            ),
                          ],
                        ),
                      ),
              ],
            ),
            if (backArrow)
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: IconButton(
                icon: Icon(Icons.logout),
                onPressed: () async {
                  await UserProvider().signOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
