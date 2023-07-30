import 'package:e_sup_app/providers/users_provider.dart';
import 'package:e_sup_app/widget/my_appBar.dart';
import 'package:e_sup_app/widget/searchBar.dart';
import 'package:e_sup_app/widget/users_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/course_material.dart';
import '../../models/user.dart';
import '../../utils/colors.dart';

enum Users {
  student,
  educator,
}

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  Users _users = Users.student;
  final searchController = TextEditingController();
  List<User> _AllUsersInSchool = [];
  bool _isLoading = false;
  var _isInit = true;

  void initState() {
    super.initState();
    //setUserInSchool();
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    User userDetail = Provider.of<UserProvider>(context, listen: false).getUser;
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(
            color: Colors.blueAccent,
          ))
        : Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyAppBar(
                        backArrow: true,
                        title: "Request",
                        name: userDetail.firstname,
                      ),
                      Search(
                        searchController: searchController,
                        textHint: "Search Educator or Student",
                      ),
                      ListTile(
                        tileColor: _users == Users.student
                            ? backgroundColor
                            : greyBackgroundColor,
                        title: Text(
                          "Students",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Radio(
                          value: Users.student,
                          groupValue: _users,
                          activeColor: secondaryColor,
                          onChanged: (Users? val) {
                            if (_users == Users.student) {
                              return;
                            } else {
                              setState(
                                () {
                                  _users = val!;
                                },
                              );
                            }
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Educators",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Radio(
                          value: Users.educator,
                          groupValue: _users,
                          activeColor: secondaryColor,
                          onChanged: (Users? val) {
                            if (_users == Users.educator) {
                              return;
                            } else {
                              setState(
                                () {
                                  _users = val!;
                                },
                              );
                            }
                          },
                          toggleable: _users == Users.educator,
                        ),
                      ),
                      if (_users == Users.student)
                        UserItem(
                            schoolId: userDetail.sId,
                            selectedUserType: "Student"),
                      if (_users == Users.educator)
                        UserItem(
                            schoolId: userDetail.sId,
                            selectedUserType: "Educator"),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
