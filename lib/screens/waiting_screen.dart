// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_sup_app/screens/login_screen.dart';
import 'package:e_sup_app/utils/utils.dart';
import 'package:flutter/material.dart';
import '../resources/auth_methods.dart';
import '../widget/my_appBar.dart';
import '../widget/my_button.dart';

class waitingScreen extends StatelessWidget {
  final String name;
  final String school;

  const waitingScreen({
    Key? key,
    required this.name,
    required this.school,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Title(color: Colors.deepPurple, child: Text("not yet approved!"))
      ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // MyAppBar(
              //   backArrow: true,
              //   title: "Not yet Approved!",
              //   name: name.toString(),
              // ),
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Image(image: AssetImage("assets/Images/waiting.jpg")),
              ),
              Text(
                'Hi $name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                ' \nWaiting.... for approval from $school School',
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
              TextButton(
                  onPressed: () async {
                    await AuthMethods().signOut();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text("Log Out")),
            ],
          ),
        ),
      ),
    );
  }
}
