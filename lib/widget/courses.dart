// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_sup_app/models/course.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/courses_provider.dart';
import 'course_item.dart';

class Courses extends StatefulWidget {
  final bool enrolled;
  final int grade;

  const Courses({
    Key? key,
    required this.enrolled,
    required this.grade,
  }) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<Course> _items = [];

  @override
  Widget build(BuildContext context) {
    if (widget.enrolled) {
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
                courseItem(
                  title: _items[i].title,
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
