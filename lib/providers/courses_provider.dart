import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> fetchCourses() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('courses').get();
      _items = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Course(
          courseId: doc.id,
          title: data['title'] ?? '',
          grade: data['grade'] ?? 0,
        );
      }).toList();
      print(_items.toList());
      notifyListeners();
    } catch (e) {
      // Handle any errors that occur during fetching.
      print('Error fetching courses: $e');
    }
  }

  List<Course> findByGrade(int gr) {
    return _items.where((course) => course.grade == gr).toList();
  }

  notifyListeners();
}
