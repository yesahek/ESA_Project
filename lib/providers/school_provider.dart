import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/school.dart';

class schoolProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<School> _items = [];

  //school geter
  List<School> get items {
    return [..._items];
  }

  // fetching schools from db and notifing the listeners
  Future<void> fetchSchools() async {
    try {
      final snapshot = await _firestore.collection('schools').get();
      _items = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return School(
          schoolId: data['schoolId'],
          schoolName: data['schoolName'],
        );
      }).toList();
      //print(_items);
      notifyListeners();
    } catch (e) {
      // Handle any errors that occur during fetching.
      print('Error fetching courses: $e');
    }
  }

  //finding school using schoolName
  String findSchoolIdByName(String name) {
    School? foundSchool = _items.firstWhere(
      (school) => school.schoolName == name,
    );
    // If the school is found, return its ID; otherwise, return an empty string.
    return foundSchool.schoolId;
  }

//get all school names for sign up screen
  List<String> getAllSchoolNames() {
    List<String> schoolNames =
        _items.map((school) => school.schoolName).toList();
    return schoolNames;
  }

  notifyListeners();
}
