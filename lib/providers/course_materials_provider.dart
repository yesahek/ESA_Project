import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_sup_app/resources/storage_methods.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';

import '../models/course_material.dart';
import 'stream_provider.dart';
import '../models/stream.dart' as model;

class courseMaterialProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<courseMaterial> _items = [];
  // get

  List<courseMaterial> get items {
    return [..._items];
  }

  void addMaterial(newMaterial) {
    _items.add(newMaterial);
    notifyListeners();
  }

//fetch and set  course Materials
  Future<void> fetchCourseMaterials() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('Course Materials')
          .orderBy('date', descending: true)
          .get();
      _items = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return courseMaterial(
          id: doc.id,
          authorId: data['authorId'],
          courseId: data['courseId'],
          date: data['date'],
          fileType: data['fileType'],
          fileUrl: data['fileUrl'],
          grade: data['grade'],
          title: data['title'],
        );
      }).toList();
      //print(_items.length);
      notifyListeners();
    } catch (e) {
      // Handle any errors that occur during fetching.
      print('Error fetching courses: $e');
    }
  }

//geting course material by course Id and Grade
  List<courseMaterial> getCourseMaterialByCourseAndGrade(
      String courseId, int grade) {
    return _items
        .where((material) =>
            material.courseId == courseId && material.grade == grade)
        .toList();
  }

//geting course material by course Id for educator screen
  List<courseMaterial> getCourseMaterialByCourseId(String courseId) {
    return _items.where((material) => material.courseId == courseId).toList();
  }

  //geting course material by docId
  Future<courseMaterial> getCourseMaterialByDocId(String docId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Course Materials')
          .doc(docId)
          .get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        return courseMaterial(
          id: docId,
          title: data['title'],
          grade: data['grade'],
          authorId: data['authorId'],
          date: data['date'],
          courseId: data['courseId'],
          fileType: data['fileType'],
          fileUrl: data['fileUrl'],
        );
      } else {
        throw Exception("Document not found");
      }
    } catch (error) {
      throw error.toString();
    }
  }

  //upload Course Material to firestorage and firebase
  Future<String> uploadCourseMaterial(String title, String description,
      int grade, String courseId, String uid, bool isVideo,
      [String videoUrl = "", File? file]) async {
    String? fileType = isVideo ? "video" : lookupMimeType(file!.path);
    String res = "Some error occurred";
    try {
      String FileUrl = "";
      isVideo
          ? FileUrl = videoUrl
          : FileUrl = await StorageMethods()
              .uploadFileToStorage("Course Materials", uid, title, file!);
      DateTime currentDate = DateTime.now(); // Get the current date and time
      Timestamp firestoreTimestamp = Timestamp.fromDate(currentDate);
      String courseMaterialId =
          const Uuid().v1(); // creates unique id based on time
      courseMaterial CourseMaterial = courseMaterial(
          id: courseMaterialId,
          title: title,
          grade: grade,
          authorId: uid,
          date: firestoreTimestamp,
          courseId: courseId,
          fileType: fileType!,
          fileUrl: FileUrl.toString());
      _firestore
          .collection("Course Materials")
          .doc(courseMaterialId)
          .set(CourseMaterial.toJson());
      courseMaterialProvider().addMaterial(CourseMaterial);

      // register on streams db
      String streamId = const Uuid().v1();
      model.Stream newStream = model.Stream(
        authorId: uid,
        streamId: streamId,
        collection: isVideo ? "videos" : "Course Materials",
        courseId: courseId,
        docId: courseMaterialId,
        date: firestoreTimestamp,
      );
      _firestore.collection("streams").doc(streamId).set(newStream.toJson());
      streamProvider().addStream(newStream);

      res = "success";
    } catch (err) {
      res = err.toString();
    }
    notifyListeners();
    return res;
  }

  notifyListeners();
}
