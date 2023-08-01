import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/users_provider.dart';
import '../../widget/add_new_assignmet.dart';
import '../../widget/my_appBar.dart';

class AssignmnetScreen extends StatefulWidget {
  const AssignmnetScreen({super.key});

  @override
  State<AssignmnetScreen> createState() => _AssignmnetScreenState();
}

class _AssignmnetScreenState extends State<AssignmnetScreen> {

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
  Widget build(BuildContext context) {
     final userDetail =
        Provider.of<UserProvider>(context, listen: false).getUser;
    var _isEducator = userDetail.type == "Educator";
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(
              backArrow: true,
              title: "Assignment",
              name: "",
            ),
            SingleChildScrollView(
      // child: Column(
      //   children: [
      //     ListView.builder(
      //       scrollDirection: Axis.vertical,
      //       shrinkWrap: true,
      //       itemCount: _items.length,
      //       itemBuilder: (_, i) => Column(
      //         children: [
      //           TextButton(
      //             onPressed: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) =>
      //                       // courseMaterialScreen(_items[i].courseId,_items[i].title),
      //                 ),
      //               );
      //             },
      //             child: courseItem(
      //               title: _items[i].title,
      //               grade: _items[i].grade,
      //             ),
      //           ),
      //           Divider(),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
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
