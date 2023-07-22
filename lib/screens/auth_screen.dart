import 'package:e_sup_app/resources/auth_methods.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widget/button.dart';
import '../widget/custom_textField.dart';
import '../widget/dropdown.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  _AuthScreenState() {
    _schoolValue = _schools[0];
  }
  List<String> _schools = ['Medhanialem', 'Addis Ketema', 'Holysavior', 'Enat'];
  List<String> _Grade = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  List<String> _sex = <String>['Male', 'Female'];

  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  String? _schoolValue = "";
  String? _sexValue = "";
  String? _gradeValue = "";

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
  }

  void signUpuser() async {
    setState(() {
      _isLoading = true;
    });
    // signup user using out atuhethods
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        firstname: _firstNameController.text,
        lastname: _lastNameController.text,
        password: _passwordController.text,
        surnname: "",
        sex: 'Male',
        type: 'Student');
    if (res == "sucess") {
      setState(() {
        _isLoading = false;
      });
    }
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ListTile(
                  tileColor: _auth == Auth.signup
                      ? backgroundColor
                      : greyBackgroundColor,
                  title: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Radio(
                    value: Auth.signup,
                    groupValue: _auth,
                    activeColor: secondaryColor,
                    onChanged: (Auth? val) {
                      setState(
                        () {
                          _auth = val!;
                        },
                      );
                    },
                  ),
                ),
                if (_auth == Auth.signup)
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    color: backgroundColor,
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Email',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _firstNameController,
                            hintText: 'First name',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _lastNameController,
                            hintText: 'Last name',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _phoneNumberController,
                            hintText: 'Phone Number',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: 'Password',
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "School ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  DropdownButton(
                                    items: _schools
                                        .map((e) => DropdownMenuItem(
                                              child: Text(e),
                                              value: e,
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _schoolValue = value.toString();
                                      });
                                    },
                                  )
                                  // Dropdown(
                                  //   drValue: schools,
                                  //   // valueNotifier: _schoolValueNotifier,
                                  // ),
                                ],
                              ),
                              const SizedBox(width: 30),
                              Column(
                                children: [
                                  Text(
                                    "Sex ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Dropdown(
                                    drValue: sex,
                                    //valueNotifier: _sexValueNotifier,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 30),
                              Column(
                                children: [
                                  Text(
                                    "Grade ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Dropdown(
                                    drValue: Grade,
                                    // valueNotifier: _gradeValueNotifier,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          MyButton(
                              onTap: () {
                                if (_signUpFormKey.currentState!.validate()) {
                                  signUpuser();
                                }
                              },
                              text: 'Sign Up')
                        ],
                      ),
                    ),
                  ),
                ListTile(
                  title: const Text(
                    'Sign In.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Radio(
                    value: Auth.signin,
                    groupValue: _auth,
                    activeColor: secondaryColor,
                    onChanged: (Auth? val) {
                      setState(
                        () {
                          _auth = val!;
                        },
                      );
                    },
                  ),
                ),
                if (_auth == Auth.signin)
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    color: backgroundColor,
                    child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Email',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: 'Password',
                          ),
                          const SizedBox(height: 10),
                          MyButton(
                              onTap: () {
                                if (_signInFormKey.currentState!.validate()) {
                                  // signInUser();
                                }
                              },
                              text: 'Sign In'),
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
