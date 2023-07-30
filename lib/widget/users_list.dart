import 'package:e_sup_app/providers/users_provider.dart';
import 'package:e_sup_app/screens/courses_screen/course_material_screen.dart';
import 'package:e_sup_app/screens/profile_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart' as model;
import 'course_item.dart';

class UserItem extends StatefulWidget {
  final String schoolId;
  final String selectedUserType;

  const UserItem({
    Key? key,
    required this.schoolId,
    required this.selectedUserType,
  }) : super(key: key);

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  late model.User userDetail;

  List<model.User> _StudentItems = [];
  List<model.User> _EducatorItems = [];

  bool _isLoading = false;
  var _isInit = true;

  void initState() {
    setState(() {
      _isLoading = true;
    });
    userDetail = Provider.of<UserProvider>(context, listen: false).getUser;
    setState(() {
      _isLoading = false;
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      _setUserInSchool().then((_) => setState(() {
            _isLoading = false;
          }));
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _setUserInSchool() async {
    try {
      List<model.User> users =
          await UserProvider().requestsForSchool(userDetail.sId);
      _EducatorItems = users.where((usr) => usr.type == "Educator").toList();
      _StudentItems = users.where((usr) => usr.type == "Student").toList();
    } catch (e) {
      // Handle the case where no users are found or any other errors that occur.
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    List<model.User> _items = [];
    if (widget.selectedUserType == "Student") {
      _items = _StudentItems;
    } else {
      _items = _EducatorItems;
    }

    return _isLoading
        ? Center(
            child: CircularProgressIndicator(
            color: Colors.blueAccent,
          ))
        : SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
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
                              ),
                            ),
                          );
                        },
                        child: courseItem(
                          title: _items[i].firstname,
                          grade: userDetail.grade,
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
