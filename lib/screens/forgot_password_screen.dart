import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:e_sup_app/utils/utils.dart';

import '../widget/custom_textField.dart';

class ForgotPasswordApp extends StatefulWidget {
  @override
  State<ForgotPasswordApp> createState() => _ForgotPasswordAppState();
}

class _ForgotPasswordAppState extends State<ForgotPasswordApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForgotPasswordScreen(),
    );
  }
}

// ignore: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void _resetPassword() async {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text);
        showSnackBar(context, "Password reset link sent successfully");
      } catch (e) {
        print('Error sending password reset email: $e');
        showSnackBar(context, e.toString());
      }
      Navigator.of(context).pop();
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyAppBarForgot(backArrow: true, title: '', name: ''),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  child: Image(
                    image: AssetImage('assets/Images/moeLogo.png'),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          controller: emailController,
                          hintText: 'Email',
                          icon: Icons.email_outlined,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _resetPassword,
                          child: Text('Send Reset Link'),
                        ),
                      ],
                    ),
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

// ignore_for_file: public_member_api_docs, sort_constructors_first

class MyAppBarForgot extends StatelessWidget {
  final bool backArrow;
  final String title;
  final String name;
  const MyAppBarForgot({
    Key? key,
    required this.backArrow,
    required this.title,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                              "",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "",
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
          ],
        ),
      ),
    );
  }
}
