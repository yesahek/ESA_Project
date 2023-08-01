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
}
