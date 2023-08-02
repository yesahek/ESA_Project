import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user.dart';
import '../../providers/users_provider.dart';
import '../../widget/my_appBar.dart';
import '../../widget/searchBar.dart';
import '../../widget/users_list.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  final searchController = TextEditingController();
  bool _isLoading = false;
  Widget build(BuildContext context) {
    User userDetail = Provider.of<UserProvider>(context, listen: false).getUser;
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(
            color: Colors.blueAccent,
          ))
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MyAppBar(
                      backArrow: true,
                      title:
                          userDetail.type == "Admin" ? "Students" : "Friends",
                      name: userDetail.firstname,
                    ),
                    Search(
                      searchController: searchController,
                      textHint: "Search Student",
                    ),
                    Divider(),
                    SizedBox(height: 20),
                    Item(
                        schoolId: userDetail.sId,
                        selectedUserType: "AllStudents"),
                  ],
                ),
              ),
            ),
          );
  }
}
