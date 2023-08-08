
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/course.dart';

class CoursesProvider with ChangeNotifier {
  List<Course> _items = [];

//  List<Course> _items = [
//   Course(
//     courseId: "c001",
//     title: "English",
//     grade: 12,
//   ),
//   Course(
//     courseId: "c001",
//     title: "Maths",
//     grade: 12,
//   ),
//];
  
  
  //course geter
  List<Course> get allItems {
    return [..._items];
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
  void addCourses(newCourse) {
    _items.add(newCourse);
    notifyListeners();
  }

// fetching courses from db and notifing the listeners
  Future<void> fetchCourses() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('courses').get();
      _items = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return Course(
          courseId: doc.id,
          title: data['title'] ?? '',
          grade: data['grade'] ?? 0,
          school: data['school'] ?? '',
        );
      }).toList();
      //print(_items);
      notifyListeners();
    } catch (e) {
      // Handle any errors that occur during fetching.
      print('Error fetching courses: $e');
    }
  }

  //Add course
  Future<String> addCourse(
      String courseTitle, int grade, String school, String uid) async {
    String res = "something wrong";
    try {
      String courseId = const Uuid().v1(); // creates unique id based on time
      Course course = Course(
        courseId: courseId,
        grade: grade,
        school: school,
        title: courseTitle,
      );
      _firestore.collection("courses").doc(courseId).set(course.toJson());
      CoursesProvider().addCourses(course);
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    notifyListeners();
    return res;
  }

  //find course by grade
  List<Course> findByGrade(int gr) {
    return _items.where((course) => course.grade == gr).toList();
  }


//find course by course Id
  List<Course> findByCourseId(int cId) {
    return _items.where((course) => course.courseId == cId).toList();
  }
//find list of course by Ids
List<Course> findByCourseIds(List cIds) {
  return _items.where((course) => cIds.contains(course.courseId)).toList();
}


//find by school
  List<Course> findBySchool(String school) {
    return _items.where((course) => course.school == school).toList();
  }
  //find all schools

  notifyListeners();
}
