// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_sup_app/providers/users_provider.dart';
import 'package:e_sup_app/responsive/mobile_screen_layout.dart';
import 'package:e_sup_app/responsive/responsive_layout.dart';
import 'package:e_sup_app/responsive/web_screen_layout.dart';
import 'package:e_sup_app/screens/login_screen.dart';
import 'package:e_sup_app/utils/utils.dart';
import 'package:flutter/material.dart';
import '../widget/my_button.dart';

class waitingScreen extends StatefulWidget {
  final String name;
  final String school;

  const waitingScreen({
    Key? key,
    required this.name,
    required this.school,
  }) : super(key: key);

  @override
  State<waitingScreen> createState() => _waitingScreenState();
}

class _waitingScreenState extends State<waitingScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Image(image: AssetImage("assets/Images/waiting.jpg")),
                ),
                Text(
                  'Hi ${widget.name}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.deepPurple,
                  ),
                ),
                Text(
                  ' \nWaiting.... for approval from ${widget.school} School',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                    content: Text("Edit"),
                    onTap: () {
                      showSnackBar(
                        context,
                        " Sorry not Available for know :) ",
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  // margin: EdgeInsets.only(left: 100, right: 100),
                  child: MyButton(
                    onTap: () async {
                      showSnackBar(context, "Refresh!");
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ResponsiveLayout(
                            mobileScreenLayout: MobileScreenLayout(),
                            webScreenLayout: WebScreenLayout(),
                          ),
                        ),
                      );
                    },
                    content: Text(
                      "Refresh",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () async {
                    await UserProvider().signOut();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Log Out",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
