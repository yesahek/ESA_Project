import 'package:e_sup_app/providers/assignment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/assignment.dart';
import '../../models/user.dart';
import '../../providers/users_provider.dart';
import '../../widget/add_new_assignmet.dart';
import '../../widget/course_item.dart';
import '../../widget/my_appBar.dart';
import '../courses_screen/course_material_screen.dart';

class AssignmnetScreen extends StatefulWidget {
  const AssignmnetScreen({super.key});

  @override
  State<AssignmnetScreen> createState() => _AssignmnetScreenState();
}

class _AssignmnetScreenState extends State<AssignmnetScreen> {
  late User userDetail;

  var _isInit = true;
  List<Assignment> _assignments = [];

  @override
  void initState() {
    super.initState();
    userDetail = Provider.of<UserProvider>(context, listen: false).getUser;
  }

  void _startAddNewAssignment(
    BuildContext ctx,
    String uid,
  ) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: AddNewAssignment(uid),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Future<void> didChangeDependencies() async {
    if (_isInit) {
      setState(() {
      });

      _assignments = await assignmentProvider()
          .fetchAssignmentsForEducator(userDetail.uid);
      setState(() {
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //var _isEducator = userDetail.type == "Educator";
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(
              backArrow: true,
              title: "Assignments",
              name: "",
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _assignments.length,
                    itemBuilder: (_, i) => Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => courseMaterialScreen(
                                  _assignments[i].courseId,
                                  _assignments[i].assignmentTitle,
                                  00
                                ),
                              ),
                            );
                          },
                          child: courseItem(
                            title: _assignments[i].assignmentTitle,
                            grade: 00,
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: userDetail.type != "Student"
          ? FloatingActionButtonLocation.endFloat
          : null,
      floatingActionButton: userDetail.type != "Student"
          ? FloatingActionButton(
              onPressed: () => _startAddNewAssignment(
                context,
                userDetail.uid,
              ),
              backgroundColor: Color.fromARGB(255, 243, 211, 115),
              child: Icon(
                Icons.add,
              ),
            )
          : null,
    );
  }
}
