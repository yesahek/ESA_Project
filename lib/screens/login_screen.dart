import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_sup_app/widget/textField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Image(
                image: NetworkImage('assets/img/moeLogo.png'),
              ),
              // SvgPicture.asset(
              //   'assets/moeLogo.png',
              //   //color: primaryColor,
              //   height: 64,
              // ),
              SizedBox(
                height: 64,
              ),
              MyTextField(
                controller: userNameController,
                maxLines: 1,
                hintText: "user name",
              )
            ],
          ),
        ),
      ),
    );
  }
}
