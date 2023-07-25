import 'package:flutter/material.dart';

import '../models/course.dart';

class CoursesProvider with ChangeNotifier {
  List<Course> _items = [
    Course(
      courseId: "c001",
      title: "English",
      grade: 12,
    ),
    Course(
      courseId: "c001",
      title: "Maths",
      grade: 12,
    ),
    Course(
      courseId: "c001",
      title: "Amharic",
      grade: 12,
    ),
    Course(
      courseId: "c001",
      title: "English",
      grade: 10,
    ),
    Course(
      courseId: "c001",
      title: "Amharic",
      grade: 10,
    ),
  ];
  List<Course> get allItems {
    return [..._items];
  }

  List<Course> findByGrade(int gr) {
    return _items.where((course) => course.grade == gr).toList();
  }

  notifyListeners();
}
