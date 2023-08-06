// ignore_for_file: unused_field

import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:e_sup_app/models/course.dart';
import 'package:e_sup_app/providers/courses_provider.dart';
import 'package:e_sup_app/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import '../resources/auth_methods.dart';
import '../providers/school_provider.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout.dart';
import '../responsive/web_screen_layout.dart';
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
  @override
  void initState() {
    super.initState();
    setSchoolNames();
  }

  late schoolProvider SchoolProvider;

  List<int> _Grade = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  List<String> _sex = ['Male', 'Female'];
  List<String> _userTypes = ['Student', 'Educator', "Admin"];
  List<String> _selectedItems = [];
  List<String> _selectedItemsCourseCode = [];

  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _customSchoolController = TextEditingController();

  String _schoolValue = "";
  String _customSchoolName = "";
  String _sexValue = "";
  int _gradeValue = 0;
  String _userTypeValue = "";
  List<Course> _course = [];
  List _grades = [];
  List<String> _schools = [];

  bool _isEducator = false;
  bool _isAdmin = false;
  bool _isStudent = false;
  bool _isLoading = false;

  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
  }

  //seting school names for dropbox
  Future<void> setSchoolNames() async {
    SchoolProvider = Provider.of<schoolProvider>(context, listen: false);
    await SchoolProvider.fetchSchools();
    _schools = await SchoolProvider.getAllSchoolNames();
  }

  //seting courses and grades for educator signup
  _setCoursesAndGrades() async {
    List<Course> _temp =
        await Provider.of<CoursesProvider>(context, listen: false)
            .findBySchool(_schoolValue);
    setState(() {
      _course = _temp;
    });
  }

// signuping a user
  void signUpuser(bool isEducator) async {
    setState(() {
      _isLoading = true;
    });

    // Check if any of the required fields are empty
    if (_emailController.text.isEmpty ||
        _firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _phoneNumberController.text.isEmpty ||
        _image == null) {
      // Show an error message to the user
      showSnackBar(context, "all fields are required");
      setState(() {
        _isLoading = false;
      });
      return;
    }

    String res = '';
    String schoolId = SchoolProvider.findSchoolIdByName(
        _schoolValue == "Other" ? _customSchoolName : _schoolValue);

    if (isEducator) {
      // signup for Teachers using auth_methods
      res = await UserProvider().signUpUser(
        email: _emailController.text,
        firstname: _firstNameController.text,
        lastname: _lastNameController.text,
        password: _passwordController.text,
        surnname: "",
        sId: schoolId,
        sex: _sexValue.toString(),
        type: _userTypeValue,
        subjects: _selectedItemsCourseCode,
        grade: _gradeValue,
        school: _schoolValue,
        phone: _phoneNumberController.text,
        file: _image!,
      );
    } else {
      // signup user using auth_methods for students
      res = await UserProvider().signUpUser(
        email: _emailController.text,
        firstname: _firstNameController.text,
        lastname: _lastNameController.text,
        password: _passwordController.text,
        surnname: "",
        sId: schoolId,
        sex: _sexValue.toString(),
        type: _userTypeValue,
        subjects: [],
        grade: _gradeValue,
        school: _schoolValue,
        phone: _phoneNumberController.text,
        file: _image!,
      );
    }

    if (res == "success") {
      showSnackBar(context, res);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ResponsiveLayout(
            webScreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout(),
          ),
        ),
      );
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

//to select prifile picture
  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CoursesProvider>(context, listen: false).fetchCourses();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 40),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : CircleAvatar(
                          radius: 70,
                          backgroundImage:
                              AssetImage('assets/Images/defaultPP.png'),
                        ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: FloatingActionButton(
                      onPressed: selectImage,
                      mini: true,
                      child: Icon(Icons.camera_alt),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
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
                      userTypeDropDown(),
                      !_isStudent ? schoolDropDown() : adminButtonFormField(),
                      !_isAdmin &&
                              !_isStudent &&
                              _isEducator &&
                              _course.isNotEmpty
                          ? buildGridLayoutBuilder(_course)
                          : SizedBox(height: 10),
                      // SizedBox(height: 10),
                      sexDropDown(),
                      if (!_isEducator && !_isAdmin) gradeDropDown(),
                      SizedBox(height: 10),
                      const SizedBox(width: 30),
                      MyButton(
                        onTap: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            signUpuser(_isEducator);
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

//Admin dropDown button
  DropdownButtonFormField<String> adminButtonFormField() {
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
        ),
      ),
      items: _schools
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList(),
      value: _schoolValue,
      onChanged: (value) {
        setState(() {
          _schoolValue = value.toString();

          // Check if "Other" is selected
          if (_schoolValue == "Other") {
            _customSchoolController.text = ""; // Clear the text field
          }

          _setCoursesAndGrades();
        });
      },
    );
  }

  TextField customSchoolTextField() {
    return TextField(
      controller: _customSchoolController,
      decoration: InputDecoration(labelText: "Custom School"),
      onChanged: (value) {
        setState(() {
          _customSchoolName = value;
        });
      },
    );
  }

//************************************************************
//
//
// Educators Grade
  Widget buildGridLayoutBuilder(List grade) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: _selectedItems
                .map(
                  (e) => Dismissible(
                    key: Key(e), // Provide a unique key for each Dismissible
                    direction: DismissDirection.up, // Allow swipe up to dismiss
                    onDismissed: (direction) {
                      setState(() {
                        _selectedItems
                            .remove(e); // Remove the item from the set
                      });
                    },
                    child: Chip(
                      label: Text(e),
                      deleteIcon: Icon(Icons.clear), // Set the close icon
                      deleteIconColor:
                          Colors.red, // Optional: Set the icon color
                      onDeleted: () {
                        setState(() {
                          _selectedItems.remove(e) &&
                              _selectedItemsCourseCode.remove(e);
                          ; // Remove the item from the set
                        });
                      },
                    ),
                  ),
                )
                .toList(),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: grade.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                  child: Text(
                    '${_course[index].grade.toString()}',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  onPressed: () async {
                    List<String> items = [];
                    items = ['${_course[index].title} ${_course[index].grade}'];
                    final List<String>? results = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return showSubjects(items: items);
                        });

                    if (results != null) {
                      setState(() {
                        for (var subject in results) {
                          if (!_selectedItems.contains(subject)) {
                            _selectedItems.add(subject);
                            _selectedItemsCourseCode
                                .add(_course[index].courseId);
                          }
                        }
                      });
                    }
                  });
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 8 / 5,
            ),
          ),
        ],
      ),
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
          if (_userTypeValue == "Educator") {
            setState(() {
              _isEducator = true;
            });
          } else if (_userTypeValue == "Admin")
            setState(() {
              //  _schools.add("Other");
              _isAdmin = true;
            });
        });
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
          _setCoursesAndGrades();
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
      items: _Grade.map((e) => DropdownMenuItem<String>(
            child: Text(e.toString()),
            value: e.toString(),
          )).toList(),
      onChanged: (value) {
        setState(() {
          _gradeValue = int.parse(value!);
        });
      },
    );
  }
}
