// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_sup_app/providers/users_provider.dart';
import 'package:e_sup_app/screens/profile_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart' as model;
import 'course_item.dart';

// ignore: must_be_immutable
class Item extends StatefulWidget {
  final String schoolId;
  final String selectedUserType;
  bool all = false;
  Item({
    Key? key,
    required this.schoolId,
    required this.selectedUserType,
  }) : super(key: key);

  @override
  State<Item> createState() => _UserItemState();
}

class _UserItemState extends State<Item> {
  late model.User userDetail;
  List<model.User> _studentItems = [];
  List<model.User> _educatorItems = [];
  List<model.User> _allStudentItems = [];
  List<model.User> _allEducatorItems = [];

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    userDetail = Provider.of<UserProvider>(context, listen: false).getUser;
    _setUserInSchool().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  Future<void> _setUserInSchool() async {
    try {
      List<model.User> users =
          await UserProvider().requestsForSchool(userDetail.sId);

      List<model.User> allUsers =
          await UserProvider().getUsersBySchoolId(userDetail.sId);
      setState(() {
        _educatorItems = users.where((usr) => usr.type == "Educator").toList();
        _studentItems = users.where((usr) => usr.type == "Student").toList();
        _allEducatorItems =
            allUsers.where((usr) => usr.type == "Educator").toList();
        _allStudentItems =
            allUsers.where((usr) => usr.type == "Student").toList();
      });
    } catch (e) {
      // Handle the case where no users are found or any other errors that occur.
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    List<model.User> _items = [];
    if (widget.selectedUserType == "Student") {
      _items = _studentItems;
    } else if (widget.selectedUserType == "Educator") {
      _items = _educatorItems;
    } else if (widget.selectedUserType == "AllStudents") {
      _items = _allStudentItems;
    } else if (widget.selectedUserType == "AllEducators") {
      _items = _allEducatorItems;
    }

    return _isLoading
        ? Center(
            child: CircularProgressIndicator(
            color: Colors.blueAccent,
          ))
        : Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _items.length,
                itemBuilder: (_, i) => Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileDetailPage(
                              firstName: _items[i].firstname,
                              email: _items[i].email,
                              grade: _items[i].grade,
                              lastName: _items[i].lastname,
                              photoUrl: _items[i].photoUrl,
                              sex: _items[i].sex,
                              type: _items[i].type,
                              phoneNumber: _items[i].phone,
                              shoolName: _items[i].school,
                              userId: _items[i].uid,
                              isForApproval:
                                  userDetail.type == "Admin" ? true : false,
                            ),
                          ),
                        );
                      },
                      child: courseItem(
                        title: _items[i].firstname,
                        grade: _items[i].grade,
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          );
  }
}
