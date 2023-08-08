// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_sup_app/models/course.dart';
import 'package:e_sup_app/screens/courses_screen/course_material_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/courses_provider.dart';
import '../providers/users_provider.dart';
import 'course_item.dart';

class Courses extends StatefulWidget {
  final bool enrolled;
  final int grade;
  final List courses;

  const Courses({
    Key? key,
    required this.enrolled,
    required this.grade,
    required this.courses,
  }) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<Course> _items = [];
  List<Course> _items2 = [];

  //var userData;
  @override
  void initState() {
    super.initState();
    //  setUserDetail();
  }

  // Future<void> setUserDetail() async {
  //   User userData =
  //       await Provider.of<UserProvider>(context, listen: false).getUser;
  //   _items2 = Provider.of<CoursesProvider>(context, listen: false)
  //       .findByCourseIds(userData.subjects);
  //   print("${userData.subjects.length} from setUser");
  // }

  @override
  Widget build(BuildContext context) {
    User userData = Provider.of<UserProvider>(context, listen: false).getUser;
    if (userData.type == "Educator" && widget.enrolled) {
      _items = Provider.of<CoursesProvider>(context, listen: false)
          .findByCourseIds(widget.courses);
    } else if (userData.type != "Educator" && widget.enrolled) {
      _items = Provider.of<CoursesProvider>(context, listen: false)
          .findByGrade(widget.grade);
    } else {
      _items = Provider.of<CoursesProvider>(context, listen: false).allItems;
    }
    return SingleChildScrollView(
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
                        builder: (context) => courseMaterialScreen(
                            _items[i].courseId, _items[i].title),
                      ),
                    );
                  },
                  child: courseItem(
                    title: _items[i].title,
                    grade: _items[i].grade,
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
