import 'package:flutter/material.dart';

import '../resources/auth_methods.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';
import '../widget/custom_textField.dart';
import '../widget/my_button.dart';
import '../widget/show_subjects.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  _SignupScreenState() {
    _schoolValue = _schools[0];
    _sexValue = _schools[0];
    _gradeValue = _Grade[0];
    _userTypeValue = _userTypes[0];
  }
  List<String> _schools = ['Medhanialem', 'Addis Ketema', 'Holysavior', 'Enat'];
  List<String> _Grade = [
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
  List<String> _sex = ['Male', 'Female'];
  List<String> _userTypes = ['Student', 'Teacher', "School", "Staff", "Guest"];
  List<String> _selectedItems = [];

  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  String _schoolValue = "___Select Your School___";
  String _sexValue = "___Select Your Gender___";
  String _gradeValue = "___Select Your Grade___";
  String _userTypeValue = "";

  bool _isTeacher = false;
  bool _isStaff = false;
  bool _isStudent = false;
  bool _isGuest = false;
  bool _isSchool = false;
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

//show subjects
  void _showSubjects() async {
    final List<String> items = [
      'Amharic',
      'English',
      'Matimatics',
      'Biology',
      'Chemistry',
      'Physics',
      'History',
      'Sport',
      'It'
    ];

    final List<String>? results = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return showSubjects(items: items);
        });

    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

// signuping a user
  void signUpuser(bool isTeacher) async {
    setState(() {
      _isLoading = true;
    });
    String res = '';
    if (isTeacher) {
      // signup for Techers using auth_methods
      res = await AuthMethods().signUpUser(
        email: _emailController.text,
        firstname: _firstNameController.text,
        lastname: _lastNameController.text,
        password: _passwordController.text,
        surnname: "",
        sex: _sexValue.toString(),
        type: _userTypeValue,
        sId: _schoolValue,
        subjects: _selectedItems,
        grade: _gradeValue,
        school: _schoolValue,
      );
    } else {
      // signup user using authethods for students
      res = await AuthMethods().signUpUser(
        email: _emailController.text,
        firstname: _firstNameController.text,
        lastname: _lastNameController.text,
        password: _passwordController.text,
        surnname: "",
        sex: _sexValue.toString(),
        type: _userTypeValue,
        sId: _schoolValue,
        subjects: [],
        grade: _gradeValue,
        school: _schoolValue,
      );
    }

    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
    }
    //print(res);
    if (res != 'success') {
      showSnackBar(context, res);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          //padding: const EdgeInsets.symmetric(horizontal: 8),
          // width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Flexible(
              //   flex: 2,
              //   child: Container(),
              // ),
              Container(
                //padding: const EdgeInsets.all(8.0),
                padding: EdgeInsets.only(left: 35, right: 35, top: 30),
                color: backgroundColor,
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _firstNameController,
                        hintText: 'First name',
                        icon: Icons.abc,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _lastNameController,
                        hintText: 'Last name',
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _phoneNumberController,
                        hintText: 'Phone Number',
                        icon: Icons.phone_enabled_outlined,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                        icon: Icons.password,
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          userTypeDropDown(),
                          // SizedBox(height: 10),
                          //if signing was a techer add sebjects filled
                          _isTeacher ? teacherSubjects() : SizedBox(height: 10),
                          schoolDropDown(),
                          SizedBox(height: 10),
                          sexDropDown(),
                          SizedBox(height: 10),
                          gradeDropDown(),
                        ],
                      ),
                      const SizedBox(width: 30),
                      MyButton(
                        onTap: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            signUpuser(_isTeacher);
                          }
                        },
                        content: _isLoading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      'Already have an account?',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        ' Login.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//************************************************************
//
//
//
//
//
////
//Teachers Subject
  Padding teacherSubjects() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Wrap(
          children: _selectedItems
              .map(
                (e) => Chip(
                  label: Text(e),
                ),
              )
              .toList(),
        ),
        ElevatedButton(onPressed: _showSubjects, child: Text("subjects"))
      ]),
    );
  }

// Dropdown widget for school
  DropdownButtonFormField<String> userTypeDropDown() {
    return DropdownButtonFormField(
      icon: const Icon(
        Icons.arrow_drop_down_circle,
        color: Colors.deepPurple,
      ),
      decoration: InputDecoration(
          labelText: "User Type",
          prefixIcon: Icon(
            Icons.home_max_sharp,
            color: Colors.deepPurple,
          )),
      items: _userTypes
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _userTypeValue = value.toString();
        });
        switch (_userTypeValue) {
          case "Teacher":
            setState(() {
              _isTeacher = true;
              _isTeacher = false;
              _isStaff = false;
              _isStudent = false;
              _isGuest = false;
              _isSchool = false;
            });
            break;
          case "Student":
            setState(() {
              _isTeacher = false;
              _isTeacher = false;
              _isStaff = false;
              _isStudent = true;
              _isGuest = false;
              _isSchool = false;
            });
            break;
          case "Staff":
            setState(() {
              _isTeacher = false;
              _isTeacher = false;
              _isStaff = true;
              _isStudent = false;
              _isGuest = false;
              _isSchool = false;
            });
            break;
          case "Guest":
            setState(() {
              _isTeacher = false;
              _isTeacher = false;
              _isStaff = false;
              _isStudent = false;
              _isGuest = true;
              _isSchool = false;
            });
            break;
          case "Staff":
            setState(() {
              _isTeacher = false;
              _isTeacher = false;
              _isStaff = false;
              _isStudent = false;
              _isGuest = false;
              _isSchool = true;
            });
            break;
          default:
            setState(() {
              _isTeacher = false;
              _isTeacher = false;
              _isStaff = false;
              _isStudent = false;
              _isGuest = false;
              _isSchool = false;
            });
        }
        if (_userTypeValue == "Teacher")
          setState(() {
            _isTeacher = !_isTeacher;
          });
      },
    );
  }

// Dropdown widget for school
  DropdownButtonFormField<String> schoolDropDown() {
    return DropdownButtonFormField(
      icon: const Icon(
        Icons.arrow_drop_down_circle,
        color: Colors.deepPurple,
      ),
      decoration: InputDecoration(
          labelText: "School",
          prefixIcon: Icon(
            Icons.home_max_sharp,
            color: Colors.deepPurple,
          )),
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
    );
  }

// Dropdown widget for
  DropdownButtonFormField<String> sexDropDown() {
    return DropdownButtonFormField(
      icon: const Icon(
        Icons.arrow_drop_down_circle,
        color: Colors.deepPurple,
      ),
      decoration: InputDecoration(
          labelText: "Sex",
          prefixIcon: Icon(
            Icons.home_max_sharp,
            color: Colors.deepPurple,
          )),
      items: _sex
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _sexValue = value.toString();
        });
      },
    );
  }

// Dropdown widget for grade
  DropdownButtonFormField<String> gradeDropDown() {
    return DropdownButtonFormField(
      icon: const Icon(
        Icons.arrow_drop_down_circle,
        color: Colors.deepPurple,
      ),
      decoration: InputDecoration(
          labelText: "Grade",
          prefixIcon: Icon(
            Icons.home_max_sharp,
            color: Colors.deepPurple,
          )),
      items: _Grade.map((e) => DropdownMenuItem(
            child: Text(e),
            value: e,
          )).toList(),
      onChanged: (value) {
        setState(() {
          _gradeValue = value.toString();
        });
      },
    );
  }
}
