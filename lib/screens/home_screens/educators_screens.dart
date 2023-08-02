import 'package:e_sup_app/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user.dart';
import '../../widget/my_appBar.dart';
import '../../widget/searchBar.dart';
import '../../widget/users_list.dart';

// ignore: must_be_immutable
class educatorsScreen extends StatelessWidget {
  educatorsScreen({super.key});

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
              child: Column(
                children: [
                  MyAppBar(
                    backArrow: true,
                    title: "Educators",
                    name: "",
                  ),
                  Search(
                    searchController: searchController,
                    textHint: "Search Student",
                  ),
                  Item(
                      schoolId: userDetail.sId,
                      selectedUserType: "AllEducators"),
                ],
              ),
            ),
          );
  }
}
