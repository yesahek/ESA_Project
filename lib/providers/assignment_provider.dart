import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';

import '../models/assignment.dart';
import '../resources/storage_methods.dart';

class assignmentProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Assignment> _items = [];

  //geter
  List<Assignment> get items {
    return [...items];
  }

  void addAssignment(newAssignment) {
    _items.add(newAssignment);
    notifyListeners();
  }

//fetch and set assignments
  Future<void> fetchCourseAssignments() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('Course Materials').get();
      _items = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return Assignment(
          assignmentId: doc.id,
          educatorId: data['educatorId'],
          courseId: data['courseId'],
          date: data['date'],
          fileType: data['fileType'],
          fileUrl: data['fileUrl'],
          assignmentTitle: data['assignmentTitle'],
          description: data['description'],
          dueDate: data['dueDate'],
        );
      }).toList();
      //print(_items.length);
      notifyListeners();
    } catch (e) {
      // Handle any errors that occur during fetching.
      print('Error fetching courses: $e');
    }
  }

//upload Assignment
  Future<String> uploadAssignment(String title, String description, int grade,
      String courseId, String uid, File file, DateTime submitDate) async {
    String? fileType = lookupMimeType(file.path);
    String res = "Some error occurred";
    try {
      String FileUrl = await StorageMethods()
          .uploadFileToStorage("Assignments", uid, title, file);
      DateTime currentDate = DateTime.now(); // Get the current date and time
      Timestamp firestoreTimestamp = Timestamp.fromDate(currentDate);
      Timestamp dueDate = Timestamp.fromDate(submitDate);
      String assignmentId =
          const Uuid().v1(); // creates unique id based on time
      Assignment assignment = Assignment(
        assignmentId: assignmentId,
        assignmentTitle: title,
        educatorId: uid,
        date: firestoreTimestamp,
        dueDate: dueDate,
        courseId: courseId,
        fileType: fileType!,
        fileUrl: FileUrl.toString(),
        description: description,
      );
      _firestore
          .collection("assignment")
          .doc(assignmentId)
          .set(assignment.toJson());
      assignmentProvider().addAssignment(assignment);

      res = "success";
    } catch (err) {
      res = err.toString();
    }
    notifyListeners();
    return res;
  }

  Future<List<Assignment>> fetchAssignmentsForEducator(
      String educatorUid) async {
    try {
      // Fetch the user document for the educator
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(educatorUid)
          .get();

      // Check if the user exists and their type is "Educator"
      if (userSnapshot.exists && userSnapshot.get("type") == "Educator") {
        List<String> subjectCodes = List.from(userSnapshot.get("subjectes"));
        List<Assignment> assignments = [];

        // Fetch assignments for each subject code in the subjectCodes list
        for (String subjectCode in subjectCodes) {
          QuerySnapshot assignmentSnapshot = await FirebaseFirestore.instance
              .collection("assignment")
              .where("courseId", isEqualTo: subjectCode)
              .get();

          // Add assignments to the assignments list
          assignments.addAll(assignmentSnapshot.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            Timestamp dateTimestamp = data['date'] as Timestamp;
            Timestamp dueDateTimestamp = data['dueDate'] as Timestamp;

            return Assignment(
              assignmentId: doc.id,
              educatorId: data['educatorId'],
              assignmentTitle: data['assignmentTitle'],
              courseId: data['courseId'],
              date: dateTimestamp,
              dueDate: dueDateTimestamp,
              fileType: data['fileType'],
              fileUrl: data['fileUrl'],
              description: data['description'],
            );
          }));
        }

        return assignments;
      } else {
        print("Educator not found");
        return [];
      }
    } catch (e) {
      print("Error fetching assignments: $e");
      return [];
    }
  }
}
