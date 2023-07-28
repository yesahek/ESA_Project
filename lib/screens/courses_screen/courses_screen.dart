import 'package:e_sup_app/providers/users_provider.dart';
import 'package:e_sup_app/widget/my_appBar.dart';
import 'package:e_sup_app/widget/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/courses_provider.dart';
import '../../utils/colors.dart';
import '../../widget/courses.dart';

enum Course {
  enrolled,
  unEnrolled,
}

class MaterialsScreen extends StatefulWidget {
  const MaterialsScreen({super.key});

  @override
  State<MaterialsScreen> createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<MaterialsScreen> {
  Course _course = Course.enrolled;
  final searchController = TextEditingController();
  bool _isLoading = false;
  var _isInit = true;

  void initState() {
    // Future.delayed(Duration.zero).then((_) => {
    //       Provider.of<CoursesProvider>(context, listen: false).fetchCourses(),
    //     });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<CoursesProvider>(context, listen: false)
          .fetchCourses()
          .then((_) => setState(() {
                _isLoading = false;
              }));
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  // void _startAddNewMaterial(BuildContext ctx, String sId, String uid) {
  //   showModalBottomSheet(
  //     context: ctx,
  //     builder: (_) {
  //       return GestureDetector(
  //         onTap: () {},
  //         child: AddNewMaterial(sId, uid),
  //         behavior: HitTestBehavior.opaque,
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final userDetail =
        Provider.of<UserProvider>(context, listen: false).getUser;

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
                        backArrow: false,
                        title: "Cources",
                        name: userDetail.firstname,
                      ),
                      Search(
                          searchController: searchController,
                          textHint: "Search course"),
                      ListTile(
                        tileColor: _course == Course.enrolled
                            ? backgroundColor
                            : greyBackgroundColor,
                        title: Text(
                          "Enrolled Courses",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Radio(
                          value: Course.enrolled,
                          groupValue: _course,
                          activeColor: secondaryColor,
                          onChanged: (Course? val) {
                            if (_course == Course.enrolled) {
                              return;
                            } else {
                              setState(
                                () {
                                  _course = val!;
                                },
                              );
                            }
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'All Courses',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Radio(
                          value: Course.unEnrolled,
                          groupValue: _course,
                          activeColor: secondaryColor,
                          onChanged: (Course? val) {
                            if (_course == Course.unEnrolled) {
                              return;
                            } else {
                              setState(
                                () {
                                  _course = val!;
                                },
                              );
                            }
                          },
                          toggleable: _course == Course.unEnrolled,
                        ),
                      ),
                      if (_course == Course.enrolled)
                        Courses(enrolled: true, grade: userDetail.grade),
                      if (_course == Course.unEnrolled)
                        Courses(enrolled: false, grade: userDetail.grade),
                    ],
                  ),
                ),
              ),
            ),
            // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () => _startAddNewMaterial(
            //     context,
            //     userDetail.sId,
            //     userDetail.uid,
            //   ),
            //   backgroundColor: Color.fromARGB(255, 243, 211, 115),
            //   child: Icon(
            //     Icons.add,
            //   ),
            // ),
          );
  }
}
